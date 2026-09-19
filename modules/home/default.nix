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

    # Disks and filesystems
    dosfstools
    gptfdisk
    parted

    # Hardware and networking
    dnsutils
    ethtool
    iproute2
    pciutils
    usbutils

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
