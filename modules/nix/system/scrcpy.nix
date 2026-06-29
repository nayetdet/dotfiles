{ user, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    android-tools
    scrcpy
  ];

  users.users.${user.name}.extraGroups = [
    "adbusers"
  ];
}
