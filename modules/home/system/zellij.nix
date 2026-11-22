{ pkgs, ... }: {
  home.packages = [ pkgs.zellij ];
  xdg.dataFile."applications/dev.zellij.Zellij.desktop".text = ''
    [Desktop Entry]
    Hidden=true
  '';
}
