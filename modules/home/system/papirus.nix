{ theme, pkgs, ... }: {
  home.packages = [
    (pkgs.papirus-icon-theme.override {
      color = theme.folderColor;
    })
  ];
}
