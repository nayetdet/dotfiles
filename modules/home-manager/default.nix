{ pkgs, ...}: {
  home.packages = with pkgs; [
    fastfetch
    ffmpeg
    git
    tmux
    tree
    yt-dlp
    zellij
    zoxide
  ];

  nixpkgs.config.allowUnfree = true;
}
