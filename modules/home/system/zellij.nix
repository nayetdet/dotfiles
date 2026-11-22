{ pkgs, ... }: {
  home.packages = [ 
    pkgs.zellij
  ];

  xdg.dataFile."applications/zellij.desktop".text = ''
    [Desktop Entry]
    Hidden=true
  '';
}
