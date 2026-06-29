{ self, user, pkgs, ... }: {
  imports = [
    (self + /modules/home/default.nix)
    (self + /modules/home/flatpak/discord.nix)
    (self + /modules/home/flatpak/firefox.nix)
    (self + /modules/home/flatpak/flameshot.nix)
    (self + /modules/home/flatpak/gpu-screen-recorder.nix)
    (self + /modules/home/flatpak/sober.nix)
    (self + /modules/home/flatpak/steam.nix)
    (self + /modules/home/system/corectrl.nix)
    (self + /modules/home/system/direnv.nix)
    (self + /modules/home/system/flatpak.nix)
    (self + /modules/home/system/ghostty.nix)
    (self + /modules/home/system/gnome.nix)
    (self + /modules/home/system/zsh.nix)
  ];

  home.username = "${user.name}";
  home.homeDirectory = "/home/${user.name}";
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
    "com.vysp3r.ProtonPlus"

    # Libre Office
    "org.libreoffice.LibreOffice"

    # Gaming
    "com.parsecgaming.parsec"
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
