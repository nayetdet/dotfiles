{ host, ... }: {
  programs.corectrl.enable = true;

  # AMDGPU
  hardware.amdgpu.overdrive.enable = true;

  # Polkit
  security.polkit.enable = true;

  users.users.${host.user.name}.extraGroups = [
    "corectrl"
  ];
}
