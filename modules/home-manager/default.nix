{ pkgs, ...}: {
  home.packages = with pkgs; [
    fastfetch
    file
    ffmpeg
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
