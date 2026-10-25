{ self, pkgs, lib, ... }:
let
  packetTracerInstaller = self + /config/packet-tracer/CiscoPacketTracer_901_Ubuntu_64bit.deb;
  packetTracerInstallerSha256 = "3683dd87e779885372ae9a35c1a6e594d12f493e649e7c697408729c1459479b";
  packetTracer =
    assert lib.assertMsg
      (builtins.hashFile "sha256" packetTracerInstaller == packetTracerInstallerSha256)
      "Invalid Cisco Packet Tracer installer: config/packet-tracer/CiscoPacketTracer_901_Ubuntu_64bit.deb must have SHA-256 ${packetTracerInstallerSha256}.";

    pkgs.cisco-packet-tracer_9.overrideAttrs (old: {
      src = old.src.overrideAttrs (_: {
        src = packetTracerInstaller;
      });
    });
in {
  programs.firejail = {
    enable = true;
    wrappedBinaries = {
      packettracer9 = {
        executable = lib.getExe packetTracer;
        desktop = "${packetTracer}/share/applications/cisco-packet-tracer-9.desktop";
        extraArgs = [
          "--net=none"
          "--noprofile"
          ''--env=QT_STYLE_OVERRIDE=""''
        ];
      };
    };
  };
}
