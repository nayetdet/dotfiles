{ host, pkgs, ... }:
let
  papirus = pkgs.papirus-icon-theme.override {
    color = host.theme.folderColor;
  };
in {
  home.packages = [ papirus ];
  home.file.".local/share/icons".source = "${papirus}/share/icons";
}
