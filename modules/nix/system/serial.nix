{ host, ... }: {
  users.users.${host.user.name}.extraGroups = [
    "dialout"
  ];

  services.udev.extraRules = ''
    SUBSYSTEM=="tty", KERNEL=="ttyUSB[0-9]*", GROUP="dialout", MODE="0660"
    SUBSYSTEM=="tty", KERNEL=="ttyACM[0-9]*", GROUP="dialout", MODE="0660"
  '';
}
