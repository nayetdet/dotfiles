{ user, ... }: {
  programs.corectrl.enable = true;

  # AMDGPU
  hardware.amdgpu.overdrive.enable = true;

  # Polkit
  security.polkit.enable = true;

  users.users.${user.name}.extraGroups = [
    "corectrl"
  ];
}
