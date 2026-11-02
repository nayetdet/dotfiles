{ pkgs, ... }: {
  home.packages = [ pkgs.vim ];

  xdg.dataFile = {
    "applications/vim.desktop".text = "[Desktop Entry]\nHidden=true\n";
    "applications/gvim.desktop".text = "[Desktop Entry]\nHidden=true\n";
  };
}
