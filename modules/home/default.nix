{ pkgs, ...}: {
  home.packages = with pkgs; [
    dnsutils
    fastfetch
    file
    ffmpeg
    fzf
    git
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
