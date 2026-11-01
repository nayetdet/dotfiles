{ inputs, pkgs, ... }: {
  imports = [ inputs.lazyvim.homeManagerModules.default ];
  home.packages = [ pkgs.vim ];
  programs.lazyvim = {
    enable = true;
    config.options = ''
      vim.opt.clipboard = "unnamedplus"
      vim.opt.number = true
      vim.opt.relativenumber = false
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
