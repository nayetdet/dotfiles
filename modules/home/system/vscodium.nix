{ inputs, pkgs, ... }: {
  nixpkgs.overlays = [
    inputs.nix-vscode-extensions.overlays.default
  ];

  home.packages = [
    (pkgs.writeShellScriptBin "code" ''
      exec ${pkgs.vscodium}/bin/codium "$@"
    '')
  ];

  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.nix-vscode-extensions.vscode-marketplace; [
        aaron-bond.better-comments
        bbenoist.nix
        emilast.logfilehighlighter
        waderyan.gitblame
        miguelsolorio.min-theme
        ms-azuretools.vscode-containers
        ms-vscode-remote.remote-containers
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        ms-vscode.remote-explorer
        repreng.csv
        thang-nm.flow-icons
      ];

      userSettings = {
        "workbench.colorTheme" = "Min Dark";
        "workbench.iconTheme" = "flow-deep";
        "git.decorations.enabled" = true;
        "explorer.decorations.colors" = true;
        "explorer.decorations.badges" = true;
        "workbench.colorCustomizations" = {
          "gitDecoration.modifiedResourceForeground" = "#e2c08d";
          "gitDecoration.addedResourceForeground" = "#81b88b";
          "gitDecoration.untrackedResourceForeground" = "#81b88b";
        };
        "editor.fontFamily" = "'JetBrainsMono Nerd Font Mono', 'Droid Sans Mono', monospace";
        "files.autoSave" = "afterDelay";
        "[javascript]" = {
          "editor.tabSize" = 2;
        };
        "[typescript]" = {
          "editor.tabSize" = 2;
        };
        "[javascriptreact]" = {
          "editor.tabSize" = 2;
        };
        "[typescriptreact]" = {
          "editor.tabSize" = 2;
        };
        "[html]" = {
          "editor.tabSize" = 2;
        };
        "[css]" = {
          "editor.tabSize" = 2;
        };
        "[scss]" = {
          "editor.tabSize" = 2;
        };
        "[sass]" = {
          "editor.tabSize" = 2;
        };
      };
    };
  };
}
