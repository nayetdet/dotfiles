{ host, ... }: {
  programs.corectrl.enable = true;

  hardware.amdgpu.overdrive.enable = true;

  security.polkit.enable = true;

  users.users.${host.user.name}.extraGroups = [
    "corectrl"
  ];
}
