{ config, pkgs, ... }:
let
  flameshotScreenshotsDirectory = "${config.home.homeDirectory}/Pictures/Screenshots";
  flameshotIniPath = "${config.home.homeDirectory}/.var/app/org.flameshot.Flameshot/config/flameshot/flameshot.ini";
  flameshotIni = (pkgs.formats.ini {}).generate "flameshot.ini" {
    General = {
      contrastOpacity = 188;
      saveAfterCopy = true;
      savePath = flameshotScreenshotsDirectory;
      showStartupLaunchMessage = false;
    };

    Shortcuts = {
      TYPE_ACCEPT = "Ctrl+C";
    };
  };
in {
  services.flatpak.packages = [
    "org.flameshot.Flameshot"
  ];

  home.packages = with pkgs; [
    wl-clipboard
  ];

  systemd.user.tmpfiles.rules = [
    "d ${flameshotScreenshotsDirectory} 0755 - - -"
    "C ${flameshotIniPath} - - - - ${flameshotIni}"
  ];

  systemd.user.services.flameshotScreenshotPermission = {
    Unit = {
      Description = "Flameshot screenshot portal permission";
      Wants = [ "flatpak-managed-install.service" ];
      After = [
        "flatpak-managed-install.service"
        "graphical-session.target"
      ];
    };

    Service = {
      Type = "oneshot";
      ExecCondition = "${pkgs.flatpak}/bin/flatpak info org.flameshot.Flameshot";
      ExecStart = "${pkgs.flatpak}/bin/flatpak permission-set screenshot screenshot org.flameshot.Flameshot yes";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

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
      command = ''${pkgs.bash}/bin/bash -c "QT_QPA_PLATFORM=wayland ${pkgs.flatpak}/bin/flatpak run --command=flameshot org.flameshot.Flameshot gui -p "${flameshotScreenshotsDirectory}" -r | ${pkgs.wl-clipboard}/bin/wl-copy"'';
      name = "Flameshot";
    };
  };
}
