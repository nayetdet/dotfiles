{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    swtpm
  ];

  programs.virt-manager.enable = true;

  virtualisation.libvirtd.enable = true;
}
