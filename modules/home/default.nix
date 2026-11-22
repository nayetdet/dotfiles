{
  self,
  host,
  pkgs,
  ...
}:
{
  imports = [
    (self + /modules/home/flatpak/discord.nix)
    (self + /modules/home/flatpak/firefox.nix)
    (self + /modules/home/flatpak/flameshot.nix)
    (self + /modules/home/flatpak/sober.nix)
    (self + /modules/home/flatpak/steam.nix)
    (self + /modules/home/system/bash.nix)
    (self + /modules/home/system/btop.nix)
    (self + /modules/home/system/direnv.nix)
    (self + /modules/home/system/flatpak.nix)
    (self + /modules/home/system/ghostty.nix)
    (self + /modules/home/system/gnome.nix)
    (self + /modules/home/system/nvim.nix)
    (self + /modules/home/system/papirus.nix)
    (self + /modules/home/system/scrcpy.nix)
    (self + /modules/home/system/vim.nix)
    (self + /modules/home/system/vscodium.nix)
    (self + /modules/home/system/yazi.nix)
    (self + /modules/home/system/zellij.nix)
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
    devcontainer
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
    tree
    ffmpeg
    yt-dlp

    # GNOME Core Apps
    gnome-disk-utility
    gnome-system-monitor
    gnome-tweaks
    nautilus

    # Utilities
    arp-scan
    dnsutils
    ethtool
    file
    iperf3
    iproute2
    jq
    lsof
    mtr
    net-tools
    nixfmt-rfc-style
    nmap
    p7zip
    pciutils
    procps
    psmisc
    ripgrep
    socat
    tcpdump
    traceroute
    unzip
    usbutils
    util-linux
    whois
    zip
  ];

  # Flatpak Packages
  services.flatpak.packages = [
    # Browsers
    "com.brave.Browser"

    # Development
    "com.ranfdev.DistroShelf"
    "com.usebruno.Bruno"
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
