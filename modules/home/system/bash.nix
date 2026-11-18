{ config, ... }: {
  programs.bash = {
    enable = true;
    shellAliases = config.programs.zsh.shellAliases;
    historyFile = "${config.home.homeDirectory}/.bash_history";
    historySize = 100000;
    historyFileSize = 100000;
    shellOptions = [ "histappend" ];
  };
}
