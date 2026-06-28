{ pkgs, ... }: {
  services.flatpak.packages = [
    "org.flameshot.Flameshot"
  ];

  services.flatpak.overrides = {
    "org.flameshot.Flameshot" = {
      Context = {
        sockets = [ "x11" "wayland" ];
        filesystems = [ "xdg-run/pipewire-0" ];
      };
    };
  };

  dconf.settings = {
    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = [];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "print";
      command = "flatpak run --command=flameshot org.flameshot.Flameshot gui";
      name = "Flameshot";
    };
  };
}
