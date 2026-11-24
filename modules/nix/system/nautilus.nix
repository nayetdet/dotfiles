{ inputs, pkgs, ... }: {
  environment.systemPackages = [
    inputs.nautilus-my-computer.packages.${pkgs.system}.default
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "ghostty";
  };
}
