{ config, lib, ... }:
let
  aliases = lib.optionalAttrs config.zsh.aliases.enable {
    ghccm = "gh copilot -- -p 'Read the staged diff and write a specific English commit message in Conventional Commits format (type(scope): summary). Output only the message.' -s --allow-tool='shell(git:*)'";
  };
in {
  options.zsh.aliases.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable configured shell aliases";
  };

  config = {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = aliases;
      oh-my-zsh = {
        enable = true;
        theme = "gentoo";
        plugins = [
          "git"
          "sudo"
          "zoxide"
        ];
      };
    };

    programs.bash = {
      enable = true;
      shellAliases = aliases;
    };
  };
}
