{ inputs, pkgs, ... }: {
  home.packages =
    (with inputs; [
      nautilus-my-computer.packages.${pkgs.stdenv.hostPlatform.system}.default
    ])
    ++ (with pkgs.python3Packages; [ pycairo ])
    ++ (with pkgs; [
      nautilus-open-any-terminal
      nautilus-python
    ]);

  home.file.".config/environment.d/99-nautilus.conf".text = ''
    NAUTILUS_4_EXTENSION_DIR=${pkgs.nautilus-python}/lib/nautilus/extensions-4
    PYTHONPATH=${pkgs.python3Packages.pycairo}/${pkgs.python3.sitePackages}
  '';

  dconf.settings."com/github/stunkymonkey/nautilus-open-any-terminal" = {
    terminal = "ghostty";
  };

  dconf.settings."io/github/yannmasoch/nautilus-my-computer" = {
    start-on-disks = false;
  };
}
