{ inputs, pkgs, ... }: {
  imports = [ inputs.lazyvim.homeManagerModules.default ];

  xdg.dataFile."applications/nvim.desktop".text = "[Desktop Entry]\nHidden=true\n";

  programs.lazyvim = {
    enable = true;
    extraPackages = with pkgs; [
      imagemagick
      ghostscript
      poppler-utils
    ];

    config.options = ''
      vim.opt.clipboard = "unnamedplus"
      vim.opt.number = true
      vim.opt.relativenumber = false
      vim.o.autowriteall = true
    '';

    plugins.hidden-files = ''
      return {
        "folke/snacks.nvim",
        opts = {
          picker = {
            sources = {
              explorer = { hidden = true },
              files = { hidden = true },
            },
          },
        },
      }
    '';

    plugins.images = ''
      return {
        "3rd/image.nvim",
        build = false,
        opts = {
          backend = "kitty",
          processor = "magick_cli",
          hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
        },
      }
    '';

    plugins.pdfreader = ''
      return {
        "r-pletnev/pdfreader.nvim",
        lazy = false,
        dependencies = {
          "folke/snacks.nvim",
          "nvim-telescope/telescope.nvim",
        },
        config = function()
          require("pdfreader").setup()
        end,
      }
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
