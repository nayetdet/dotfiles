{ self, config, lib, pkgs, ... }:
let
  screenshotsDir = "${config.home.homeDirectory}/Pictures/Screenshots";
  flameshotConfigSource = self + /config/flameshot/flameshot.ini;
  flameshotConfigTarget = "${config.home.homeDirectory}/.var/app/org.flameshot.Flameshot/config/flameshot/flameshot.ini";
in {
  home.packages = with pkgs; [
    wl-clipboard
  ];

  services.flatpak.packages = [
    "org.flameshot.Flameshot"
  ];

  home.activation.flameshotSetup = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "${screenshotsDir}"
    install -Dm644 "${flameshotConfigSource}" "${flameshotConfigTarget}"
    ${pkgs.flatpak}/bin/flatpak permission-set screenshot screenshot org.flameshot.Flameshot yes
  '';

  dconf.settings = {
    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = [];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "Print";
      command = ''bash -c "QT_QPA_PLATFORM=wayland flatpak run --command=flameshot org.flameshot.Flameshot gui -p "${screenshotsDir}" -r | wl-copy"'';
      name = "Flameshot";
    };
  };
}
