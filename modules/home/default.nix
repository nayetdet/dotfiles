{ pkgs, ...}: {
  home.packages = with pkgs; [
    dnsutils
    fastfetch
    file
    ffmpeg
    fzf
    git
    git-lfs
    jq
    tmux
    tree
    unzip
    yt-dlp
    zellij
    zip
    zoxide
  ];

  nixpkgs.config.allowUnfree = true;
}
