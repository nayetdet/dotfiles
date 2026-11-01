{ pkgs, ...}: {
  home.packages = with pkgs; [
    # Archives
    p7zip
    unzip
    zip

    # Development Tools
    git
    git-lfs
    gh
    gnumake

    # Data Processing
    jq

    # Hardware Utilities
    ethtool
    pciutils
    usbutils

    # Networking
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

    # Media
    ffmpeg
    yt-dlp

    # System Utilities
    fastfetch
    file
    lsof
    psmisc
    procps
    util-linux

    # Terminal
    fzf
    tmux
    tree
    zellij
    zoxide
  ];

  nixpkgs.config.allowUnfree = true;
}
