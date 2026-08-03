{ pkgs, ... }:
let
  setMinitelaBrightness = pkgs.writeShellScript "set-minitela-brightness" ''
    set -euo pipefail
    shopt -s nullglob

    readonly baudRate=115200
    readonly initPacket='\x41\x48\x00\x02\x00\x80\x00\x00\x4d\x49'
    readonly brightnessPacket='\x41\x48\x00\x09\x00\x90\x80\x00\x07\x00\x00\x00\x00\x00\x00\x4d\x49'

    devices=(/dev/ttyACM* /dev/ttyUSB*)
    device="''${devices[0]:-}"

    [[ -n "$device" ]] || exit 1
    ${pkgs.coreutils}/bin/stty -F "$device" "$baudRate" cs8 -cstopb -parenb raw -echo -ixon -ixoff -crtscts
    printf '%b' "$initPacket" > "$device"
    ${pkgs.coreutils}/bin/sleep 1
    printf '%b' "$brightnessPacket" > "$device"
  '';
in
{
  systemd.services.minitela-brilho = {
    description = "Set Minitela brightness to zero";
    after = [ "basic.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = setMinitelaBrightness;
    };
  };
}
