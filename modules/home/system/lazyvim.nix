{ inputs, pkgs, ... }: {
  imports = [ inputs.lazyvim.homeManagerModules.default ];
  home.packages = [ pkgs.vim ];
  programs.lazyvim = {
    enable = true;
    config.options = ''
      vim.opt.clipboard = "unnamedplus"
      vim.opt.number = true
      vim.opt.relativenumber = false
      vim.o.autowrite = true
    '';

    plugins.colorscheme = ''
      return {
        { "EdenEast/nightfox.nvim" },
        {
          "LazyVim/LazyVim",
          opts = { colorscheme = "carbonfox" },
        },
      }
    '';
  };
}
