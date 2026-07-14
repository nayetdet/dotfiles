{ self, user, pkgs, ... }: {
  imports = [
    ./hardware.nix

    (self + /modules/nix/default.nix)
    (self + /modules/nix/flatpak/gpu-screen-recorder.nix)
    (self + /modules/nix/system/app-image.nix)
    (self + /modules/nix/system/docker.nix)
    (self + /modules/nix/system/fail2ban.nix)
    (self + /modules/nix/system/flatpak.nix)
    (self + /modules/nix/system/gnome.nix)
    (self + /modules/nix/system/podman.nix)
    (self + /modules/nix/system/scrcpy.nix)
    (self + /modules/nix/system/ssh.nix)
    (self + /modules/nix/system/tailscale.nix)
  ];

  # State
  system.stateVersion = "26.05";

  # Bootloader and Kernel
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices.cryptroot.allowDiscards = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Users
  users.users.${user.name} = {
    isNormalUser = true;
    description = "${user.description}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
