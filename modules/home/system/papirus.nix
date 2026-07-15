{ host, pkgs, ... }: {
  home.packages = [
    (pkgs.papirus-icon-theme.override {
      color = host.theme.folderColor;
    })
  ];
}
