{ pkgs, ...}: {
  home.packages = with pkgs; [
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
