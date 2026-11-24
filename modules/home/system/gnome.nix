{
  self,
  host,
  pkgs,
  ...
}:
let
  wallpaper = "file://${self}/assets/wallpaper.png";
in
{
  home.packages =
    (with pkgs; [
      libgda6
      gsound
    ])
    ++ (with pkgs.gnomeExtensions; [
      appindicator
      color-picker
      copyous
      dash-to-dock
      desktop-icons-ng-ding
      emoji-copy
      lock-keys-2
      quick-settings-audio-panel
      status-area-horizontal-spacing
    ]);

  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = wallpaper;
      picture-uri-dark = wallpaper;
      picture-options = "zoom";
    };

    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };

    "org/gnome/desktop/datetime" = {
      automatic-timezone = true;
    };

    "org/gnome/desktop/interface" = {
      accent-color = host.theme.theme;
      clock-format = "24h";
      clock-show-date = true;
      clock-show-seconds = true;
      clock-show-weekday = true;
      clock-show-weekdate = true;
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
      icon-theme = host.theme.iconTheme;
    };

    "org/gnome/desktop/screensaver" = {
      picture-uri = wallpaper;
      picture-options = "zoom";
    };

    "org/gnome/desktop/wm/keybindings" = {
      show-desktop = [ "<Super>d" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "color-picker@tuberry"
        "copyous@boerdereinar.dev"
        "dash-to-dock@micxgx.gmail.com"
        "ding@rastersoft.com"
        "emoji-copy@felipeftn"
        "lockkeys@vaina.lt"
        "quick-settings-audio-panel@rayzeq.github.io"
        "status-area-horizontal-spacing@mathematical.coffee.gmail.com"
      ];
    };

    "org/gnome/shell/extensions/copyous" = {
      clipboard-history = "keep-all";
      clipboard-position-vertical = "bottom";
      database-backend = "json";
      history-length = 150;
      indicator-display = "hidden";
      item-height = 250;
      open-clipboard-dialog-shortcut = [ "<Super>V" ];
      toggle-incognito-mode-shortcut = [ ];
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      autohide = true;
      background-color = "rgb(0,0,0)";
      custom-background-color = true;
      custom-theme-shrink = true;
      dash-max-icon-size = 48;
      dock-fixed = false;
      dock-position = "BOTTOM";
      intellihide = true;
      pressure-threshold = 25.0;
      running-indicator-dominant-color = true;
      running-indicator-style = "DOTS";
    };

    "org/gnome/shell/extensions/emoji-copy" = {
      always-show = false;
    };

    "org/gnome/shell/extensions/quick-settings-audio-panel" = {
      always-show-input-volume-slider = true;
      create-mpris-controllers = false;
      create-profile-switcher = true;
      group-applications-volume-sliders = true;
      mpris-controlers-are-moved = false;
      move-input-volume-slider = false;
      move-output-volume-slider = false;
      panel-type = "merged-panel";
    };

    "org/gnome/shell/keybindings" = {
      toggle-message-tray = [ ];
    };
  };
}
