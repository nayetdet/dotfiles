{ pkgs, ... }: {
  home.packages = [ pkgs.yazi ];

  xdg.dataFile."applications/yazi.desktop".text = ''
    [Desktop Entry]
    Hidden=true
  '';
}
