{ self, host, pkgs, ... }: {
  imports = [
    (self + /modules/home/default.nix)
    (self + /modules/home/flatpak/discord.nix)
    (self + /modules/home/flatpak/firefox.nix)
    (self + /modules/home/flatpak/flameshot.nix)
    (self + /modules/home/flatpak/gpu-screen-recorder.nix)
    (self + /modules/home/flatpak/sober.nix)
    (self + /modules/home/flatpak/steam.nix)
    (self + /modules/home/system/direnv.nix)
    (self + /modules/home/system/flatpak.nix)
    (self + /modules/home/system/ghostty.nix)
    (self + /modules/home/system/gnome.nix)
    (self + /modules/home/system/papirus.nix)
    (self + /modules/home/system/zsh.nix)
  ];

  home.username = "${host.user.name}";
  home.homeDirectory = "/home/${host.user.name}";
  home.stateVersion = host.stateVersion;
  home.packages = with pkgs; [
    # Containers & Virtualisation
    distrobox
    kind
    kubectl

    # Development Tools
    vscode

    # GNOME Core Apps
    nautilus
    gnome-disk-utility
    gnome-system-monitor
    gnome-tweaks

    # Utilities
    xclicker
  ];

  services.flatpak.packages = [
    # Browsers
    "com.brave.Browser"

    # Containers & Virtualisation
    "com.ranfdev.DistroShelf"

    # Conversion Tools
    "com.github.huluti.Curtail"
    "com.belmoussaoui.Decoder"
    "fr.handbrake.ghb"
    "io.gitlab.adhami3310.Converter"

    # Development Tools
    "com.getpostman.Postman"
    "com.mongodb.Compass"
    "com.redis.RedisInsight"
    "io.dbeaver.DBeaverCommunity"

    # Documents
    "org.libreoffice.LibreOffice"

    # Downloading
    "com.vysp3r.ProtonPlus"
    "org.nickvision.tubeconverter"
    "org.qbittorrent.qBittorrent"

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
    "com.rafaelmardojai.Blanket"
    "com.spotify.Client"
    "com.stremio.Stremio"
    "info.febvre.Komikku"

    # Studio
    "com.obsproject.Studio"
    "org.gimp.GIMP"
    "org.kde.kdenlive"

    # Security
    "com.bitwarden.desktop"
  ];
}
