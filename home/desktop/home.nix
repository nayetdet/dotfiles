{ pkgs, ... }: {
  imports = [
    ../../modules/home-manager/default.nix
    ../../modules/home-manager/flatpak/discord.nix
    ../../modules/home-manager/flatpak/firefox.nix
    ../../modules/home-manager/flatpak/flameshot.nix
    ../../modules/home-manager/flatpak/gpu-screen-recorder.nix
    ../../modules/home-manager/flatpak/steam.nix
    ../../modules/home-manager/system/flatpak.nix
    ../../modules/home-manager/system/ghostty.nix
    ../../modules/home-manager/system/gnome.nix
    ../../modules/home-manager/system/zsh.nix
  ];

  home.username = "nayetdet";
  home.homeDirectory = "/home/nayetdet";
  home.stateVersion = "26.05";
  home.packages = with pkgs; [
    # Development
    vscode

    # GNOME Core Apps
    nautilus
    gnome-disk-utility
    gnome-system-monitor
  ];

  services.flatpak.packages = [
    # Browsers
    "com.brave.Browser"

    # Development
    "io.dbeaver.DBeaverCommunity"
    "com.getpostman.Postman"
    "com.mongodb.Compass"
    "com.redis.RedisInsight"

    # Downloading
    "org.nickvision.tubeconverter"
    "org.qbittorrent.qBittorrent"

    # Gaming
    "org.vinegarhq.Sober"
    "org.prismlauncher.PrismLauncher"
    "sh.ppy.osu"

    # GNOME Core Apps
    "org.gnome.baobab"
    "org.gnome.Calculator"
    "org.gnome.Evince"
    "org.gnome.Loupe"
    "org.gnome.Music"
    "org.gnome.SimpleScan"
    "org.gnome.TextEditor"
    "org.gnome.Totem"

    # Media
    "com.spotify.Client"
    "com.stremio.Stremio"
    "info.febvre.Komikku"

    # Recording & Streaming
    "com.obsproject.Studio"

    # Security
    "com.bitwarden.desktop"

    # Utils
    "com.belmoussaoui.Decoder"
  ];
}
