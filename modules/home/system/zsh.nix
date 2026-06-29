{ self, config, lib, ... }: {
  options.zsh.aliases.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable zsh aliases";
  };

  config = {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "gentoo";
        plugins = [
          "git"
          "sudo"
          "zoxide"
        ];
      };

      shellAliases = lib.mkIf config.zsh.aliases.enable {
        codex = "nix develop ${self}#agents -c codex";
        opencode = "nix develop ${self}#agents -c opencode";
      };
    };
  };
}
