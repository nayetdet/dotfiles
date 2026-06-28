{ pkgs, ... }: {
  # NixOS
  documentation.nixos.enable = false;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Locale and Time Zone
  console.keyMap = "br-abnt2";
  services.xserver.xkb.layout = "br";
  services.xserver.xkb.variant = "abnt2";
  time.timeZone = "America/Fortaleza";

  # Users
  users.defaultUserShell = pkgs.zsh;

  # Programs
  programs.dconf.enable = true;
  programs.zsh.enable = true;
}
