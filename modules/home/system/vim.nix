{ pkgs, ... }: {
  home.packages = [ pkgs.vim ];
  xdg.dataFile = {
    "applications/vim.desktop".text = ''
      [Desktop Entry]
      Hidden=true
    '';

    "applications/gvim.desktop".text = ''
      [Desktop Entry]
      Hidden=true
    '';
  };
}
