{ self, lib, pkgs, ... }:
let
  installerPath = self + /config/packet-tracer/CiscoPacketTracer_901_Ubuntu_64bit.deb;
  installerExists =
    builtins.pathExists installerPath
    && builtins.hashFile "sha256" installerPath == "3683dd87e779885372ae9a35c1a6e594d12f493e649e7c697408729c1459479b";

  package = pkgs.cisco-packet-tracer_9.override {
    requireFile = { name, hash, ... }:
      assert lib.assertMsg
        (installerExists
          && name == "CiscoPacketTracer_901_Ubuntu_64bit.deb"
          && hash == "sha256-NoPdh+d5iFNyrpo1wabllNEvST5knnxpdAhynBRZR5s=")
        "Packet Tracer requires the verified CiscoPacketTracer_901_Ubuntu_64bit.deb; Nixpkgs requested ${name} (${hash}).";
      installerPath;
  };

  desktopItem = pkgs.makeDesktopItem {
    name = "packettracer";
    desktopName = "Cisco Packet Tracer";
    exec = "packettracer %f";
    icon = "packet-tracer";
    terminal = false;
    startupNotify = true;
    startupWMClass = "PacketTracer";
    categories = [ "Education" ];
    mimeTypes = [
      "application/x-pkt"
      "application/x-pka"
      "application/x-pkz"
      "application/x-pks"
      "application/x-pksz"
    ];
  };
in {
  config = lib.mkIf installerExists {
    environment.systemPackages = [ desktopItem ];
    programs.firejail = {
      enable = true;
      wrappedBinaries.packettracer = {
        executable = lib.getExe package;
        extraArgs = [
          "--net=none"
          "--noprofile"
          ''--env=QT_STYLE_OVERRIDE=""''
        ];
      };
    };
  };
}
