{ host, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    android-tools
    scrcpy
  ];

  users.users.${host.user.name}.extraGroups = [
    "adbusers"
  ];
}
