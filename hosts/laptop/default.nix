{ self, ... }: {
  imports = [
    ./hardware.nix

    (self + /modules/nix/default.nix)
    (self + /modules/nix/system/exclusive/laptop/minitela.nix)
  ];

  # Bootloader & Kernel
  boot.initrd.luks.devices.cryptroot.allowDiscards = true;
}
