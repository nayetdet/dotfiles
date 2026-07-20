{ ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Adwaita Dark";
      shell-integration-features = "ssh-env";
    };
  };

  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Ctrl><Alt>t";
      command = "ghostty";
      name = "Ghostty";
    };
  };
}
