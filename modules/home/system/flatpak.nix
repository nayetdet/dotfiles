{ inputs, config, ... }: {
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak = {
    enable = true;
    update.auto.enable = true;
    update.auto.onCalendar = "daily";
    overrides.global.Context.filesystems = [ "xdg-data/icons:ro" ];
  };

  xdg.systemDirs.data = [
    "/var/lib/flatpak/exports/share"
    "${config.home.homeDirectory}/.local/share/flatpak/exports/share"
  ];
}
