{ self, pkgs, lib, ... }:
let
  packetTracerInstaller = self + /config/packet-tracer/CiscoPacketTracer_901_Ubuntu_64bit.deb;
  packetTracerInstallerSha256 = "3683dd87e779885372ae9a35c1a6e594d12f493e649e7c697408729c1459479b";
  packetTracer = pkgs.cisco-packet-tracer_9.override {
    requireFile = { name, hash, ... }:
      assert lib.assertMsg
        (name == "CiscoPacketTracer_901_Ubuntu_64bit.deb"
          && hash == "sha256-NoPdh+d5iFNyrpo1wabllNEvST5knnxpdAhynBRZR5s="
          && builtins.hashFile "sha256" packetTracerInstaller == packetTracerInstallerSha256)
        "Invalid Packet Tracer installer at ${toString packetTracerInstaller}; Nixpkgs expects ${name} (${hash}) with SHA-256 ${packetTracerInstallerSha256}.";
      packetTracerInstaller;
  };

  packetTracerDesktop = pkgs.makeDesktopItem {
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
  environment.systemPackages = [ packetTracerDesktop ];
  programs.firejail = {
    enable = true;
    wrappedBinaries = {
      packettracer = {
        executable = lib.getExe packetTracer;
        extraArgs = [
          "--net=none"
          "--noprofile"
          ''--env=QT_STYLE_OVERRIDE=""''
        ];
      };
    };
  };
}
