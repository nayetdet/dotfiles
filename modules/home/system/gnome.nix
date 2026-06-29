{ self, profile, pkgs, ... }: {
  home.packages = (with pkgs; [
    papirus-icon-theme
  ]) ++ (with pkgs.gnomeExtensions; [
    appindicator
    blur-my-shell
    color-picker
    copyous
    dash-to-dock
    desktop-icons-ng-ding
    emoji-copy
    free-space-indicator
    lock-keys-2
    quick-settings-audio-panel
    status-area-horizontal-spacing
  ]);

  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "file://${self}/assets/wallpapers/${profile}.png";
      picture-uri-dark = "file://${self}/assets/wallpapers/${profile}.png";
      picture-options = "zoom";
    };

    "org/gnome/desktop/screensaver" = {
      picture-uri = "file://${self}/assets/wallpapers/${profile}.png";
      picture-options = "zoom";
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      icon-theme = "Papirus-Dark";
      enable-hot-corners = false;

      clock-format = "24h";
      clock-show-weekday = true;
      clock-show-date = true;
      clock-show-seconds = true;
      clock-show-weekdate = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      show-desktop = [ "<Super>d" ];
    };

    "org/gnome/shell/keybindings" = {
      toggle-message-tray = [];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
        "color-picker@tuberry"
        "copyous@boerdereinar.dev"
        "dash-to-dock@micxgx.gmail.com"
        "ding@rastersoft.com"
        "emoji-copy@felipeftn"
        "freespace@inbalboa.github.io"
        "lockkeys@vaina.lt"
        "quick-settings-audio-panel@rayzeq.github.io"
        "status-area-horizontal-spacing@mathematical.coffee.gmail.com"
      ];
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      blur = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      brightness = 0.0;
      static-blur = false;
      unblur-in-overview = false;
    };

    "org/gnome/shell/extensions/copyous" = {
      clipboard-history = "keep-all";
      clipboard-position-vertical = "bottom";
      history-length = 150;
      item-height = 250;
      open-clipboard-dialog-shortcut = [ "<Super>V" ];
      toggle-incognito-mode-shortut = [];
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      background-color = "rgb(0,0,0)";
      custom-background-color = true;
      custom-theme-shrink = true;
      dash-max-icon-size = 48;
      dock-fixed = true;
      dock-position = "LEFT";
      extend-height = true;
      running-indicator-dominant-color = true;
      running-indicator-style = "DOTS";
    };

    "org/gnome/shell/extensions/freespace" = {
      indicator-display-mode = "icon";
    };
      
    "org/gnome/shell/extensions/quick-settings-audio-panel" = {
      create-mpris-controllers = false;
      create-profile-switcher = true;
      group-applications-volume-sliders = true;
      move-input-volume-slider = false;
      move-output-volume-slider = false;
      mpris-controlers-are-moved = false;
      panel-type = "merged-panel";
    };
  };
}
