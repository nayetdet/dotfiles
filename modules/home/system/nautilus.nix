{ inputs, pkgs, ... }: {
  home.packages =
    (with inputs; [ nautilus-my-computer.packages.${pkgs.system}.default ])
    ++ (with pkgs; [
      nautilus-open-any-terminal
      nautilus-python
    ]);

  home.file.".config/environment.d/nautilus.conf".text = ''
    NAUTILUS_4_EXTENSION_DIR=${pkgs.nautilus-python}/lib/nautilus/extensions-4
  '';

  dconf.settings."com/github/stunkymonkey/nautilus-open-any-terminal" = {
    terminal = "ghostty";
  };
}
