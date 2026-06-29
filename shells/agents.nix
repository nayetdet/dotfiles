{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    codex
    opencode
  ];
}
