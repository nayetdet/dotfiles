{ user, ... }: {
  programs.corectrl.enable = true;

  hardware.amdgpu.overdrive.enable = true;

  security.polkit.enable = true;

  users.users.${user.name}.extraGroups = [
    "corectrl"
  ];
}
