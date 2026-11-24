{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [ inputs.nix-vscode-extensions.overlays.default ];

  home.packages = [
    (pkgs.writeShellScriptBin "code" ''
      exec ${pkgs.vscodium}/bin/codium "$@"
    '')
  ];

  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium;
    argvSettings = {
      "enable-proposed-api" = [ "s-h-a-d-o-w.dev-containers-oss" ];
    };

    profiles.default = {
      extensions =
        (with pkgs.nix-vscode-extensions.vscode-marketplace; [
          aaron-bond.better-comments
          bbenoist.nix
          emilast.logfilehighlighter
          miguelsolorio.min-theme
          ms-azuretools.vscode-containers
          repreng.csv
          thang-nm.flow-icons
          waderyan.gitblame
        ])
        ++ (with pkgs.nix-vscode-extensions.open-vsx; [
          jeanp413.open-remote-ssh
          s-h-a-d-o-w.dev-containers-oss
          s-h-a-d-o-w.devcontainer-open-containing-folder
        ]);

      userSettings = {
        "editor.fontFamily" = "'JetBrainsMono Nerd Font Mono', 'Droid Sans Mono', monospace";
        "explorer.decorations.badges" = true;
        "explorer.decorations.colors" = true;
        "files.autoSave" = "afterDelay";
        "git.decorations.enabled" = true;
        "redhat.telemetry.enabled" = false;
        "workbench.colorCustomizations" = {
          "gitDecoration.addedResourceForeground" = "#81b88b";
          "gitDecoration.modifiedResourceForeground" = "#e2c08d";
          "gitDecoration.untrackedResourceForeground" = "#81b88b";
        };
        "workbench.colorTheme" = "Min Dark";
        "workbench.iconTheme" = "flow-deep";
        "[css]" = {
          "editor.tabSize" = 2;
        };
        "[html]" = {
          "editor.tabSize" = 2;
        };
        "[javascript]" = {
          "editor.tabSize" = 2;
        };
        "[javascriptreact]" = {
          "editor.tabSize" = 2;
        };
        "[sass]" = {
          "editor.tabSize" = 2;
        };
        "[scss]" = {
          "editor.tabSize" = 2;
        };
        "[typescript]" = {
          "editor.tabSize" = 2;
        };
        "[typescriptreact]" = {
          "editor.tabSize" = 2;
        };
      };
    };
  };
}
