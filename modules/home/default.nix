{ self, pkgs, ...}: {
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

  nixpkgs.config.allowUnfree = true;
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

  services.flatpak.packages = [
    # Browsers
    "com.brave.Browser"

    # Development & Containers
    "com.ranfdev.DistroShelf"
    "com.getpostman.Postman"
    "com.mongodb.Compass"
    "com.redis.RedisInsight"
    "io.dbeaver.DBeaverCommunity"

    # Documents & GNOME
    "org.libreoffice.LibreOffice"
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

    # Media & Downloads
    "com.spotify.Client"
    "com.stremio.Stremio"
    "com.obsproject.Studio"
    "com.vysp3r.ProtonPlus"
    "org.nickvision.tubeconverter"
    "org.qbittorrent.qBittorrent"

    # Gaming
    "org.prismlauncher.PrismLauncher"
    "sh.ppy.osu"

    # Remote Access
    "com.anydesk.Anydesk"
    "com.parsecgaming.parsec"

    # Security & Utilities
    "com.bitwarden.desktop"
    "com.belmoussaoui.Decoder"
  ];
}
