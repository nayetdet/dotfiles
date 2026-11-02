{ self, host, pkgs, ...}: {
  imports = [
    (self + /modules/home/flatpak/discord.nix)
    (self + /modules/home/flatpak/firefox.nix)
    (self + /modules/home/flatpak/flameshot.nix)
    (self + /modules/home/flatpak/sober.nix)
    (self + /modules/home/flatpak/steam.nix)
    (self + /modules/home/system/direnv.nix)
    (self + /modules/home/system/flatpak.nix)
    (self + /modules/home/system/ghostty.nix)
    (self + /modules/home/system/gnome.nix)
    (self + /modules/home/system/lazyvim.nix)
    (self + /modules/home/system/papirus.nix)
    (self + /modules/home/system/vscodium.nix)
    (self + /modules/home/system/zsh.nix)
  ];

  # Nix
  nixpkgs.config.allowUnfree = true;

  # Home
  home.stateVersion = host.stateVersion;
  home.username = host.user.username;
  home.homeDirectory = "/home/${host.user.username}";

  # System Packages
  home.packages = with pkgs; [
    # AI Development Tools
    codex
    github-copilot-cli

    # Development Tools
    git
    git-lfs
    gh
    gnumake
    ansible
    awscli2
    terraform
    ngrok
    distrobox
    kind
    kubectl
    kubernetes-helm

    # Terminal Tools
    fastfetch
    fzf
    zoxide
    tmux
    zellij
    tree
    ffmpeg
    yt-dlp

    # GNOME Core Apps
    gnome-disk-utility
    gnome-system-monitor
    gnome-tweaks
    nautilus

    # Utilities
    p7zip
    unzip
    zip
    jq
    ethtool
    pciutils
    usbutils
    arp-scan
    dnsutils
    iproute2
    iperf3
    mtr
    net-tools
    nmap
    socat
    tcpdump
    traceroute
    whois
    file
    lsof
    psmisc
    procps
    util-linux
  ];

  # Flatpak Packages
  services.flatpak.packages = [
    # Browsers
    "com.brave.Browser"

    # Development
    "com.ranfdev.DistroShelf"
    "com.getpostman.Postman"
    "com.mongodb.Compass"
    "com.redis.RedisInsight"
    "io.dbeaver.DBeaverCommunity"

    # GNOME Core Apps
    "ca.desrt.dconf-editor"
    "org.gnome.baobab"
    "org.gnome.Calculator"
    "org.gnome.Decibels"
    "org.gnome.Evince"
    "org.gnome.Loupe"
    "org.gnome.Music"
    "org.gnome.Snapshot"
    "org.gnome.SimpleScan"
    "org.gnome.TextEditor"
    "org.gnome.Totem"

    # Documents
    "org.libreoffice.LibreOffice"

    # Downloading
    "com.vysp3r.ProtonPlus"
    "org.nickvision.tubeconverter"
    "org.qbittorrent.qBittorrent"

    # Media
    "com.spotify.Client"
    "com.stremio.Stremio"
    "com.obsproject.Studio"

    # Gaming
    "org.prismlauncher.PrismLauncher"
    "sh.ppy.osu"

    # Remote Access
    "com.anydesk.Anydesk"
    "com.parsecgaming.parsec"

    # Utilities
    "com.bitwarden.desktop"
    "com.belmoussaoui.Decoder"
  ];
}
