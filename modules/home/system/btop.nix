{ pkgs, ... }: {
  home.packages = [ pkgs.btop ];

  xdg.dataFile."applications/btop.desktop".text = ''
    [Desktop Entry]
    Hidden=true
  '';
}
