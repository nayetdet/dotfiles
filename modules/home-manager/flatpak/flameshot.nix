{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    wl-clipboard
  ];

  services.flatpak.packages = [
    "org.flameshot.Flameshot"
  ];

  home.activation.flameshotSetup = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "${config.home.homeDirectory}/Pictures/Screenshots"
    ${pkgs.flatpak}/bin/flatpak permission-set screenshot screenshot org.flameshot.Flameshot yes
  '';

  home.file.".config/flameshot/flameshot.ini".text = ''
    [General]
    contrastOpacity=188
    saveAfterCopy=true
    savePath=${config.home.homeDirectory}/Pictures/Screenshots
    showStartupLaunchMessage=false

    [Shortcuts]
    TYPE_ACCEPT=Ctrl+C
  '';

  dconf.settings = {
    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = [];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "print";
      command = ''bash -c "flatpak run --command=flameshot org.flameshot.Flameshot gui -r | wl-copy"'';
      name = "Flameshot";
    };
  };

  xdg.configFile."autostart/flameshot.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Flameshot
    Exec=flatpak run org.flameshot.Flameshot
    X-GNOME-Autostart-enabled=true
  '';
}
