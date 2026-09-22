{ pkgs, ...}: {
  home.packages = with pkgs; [
    # Archives
    p7zip
    unzip
    zip

    # Development
    git
    git-lfs
    gnumake
    jq

    # Hardware and networking
    dnsutils
    ethtool
    iproute2
    iperf3
    mtr
    net-tools
    nmap
    pciutils
    socat
    tcpdump
    traceroute
    usbutils
    whois

    # Media and downloads
    ffmpeg
    yt-dlp

    # System utilities
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
