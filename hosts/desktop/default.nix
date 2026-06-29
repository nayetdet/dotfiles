{ self, user, pkgs, ... }: {
  imports = [
    ./hardware.nix
    ./mount.nix

    (self + /modules/nixos/default.nix)
    (self + /modules/nixos/flatpak/gpu-screen-recorder.nix)
    (self + /modules/nixos/system/cups.nix)
    (self + /modules/nixos/system/docker.nix)
    (self + /modules/nixos/system/flatpak.nix)
    (self + /modules/nixos/system/gnome.nix)
    (self + /modules/nixos/system/podman.nix)
    (self + /modules/nixos/system/scrcpy.nix)
    (self + /modules/nixos/system/ssh.nix)
  ];

  # Release compatibility
  system.stateVersion = "26.05";

  # Bootloader and Kernel
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Networking
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      ensureProfiles.profiles.static-profile = {
        connection = {
          id = "Wired connection 1";
          type = "ethernet";
          interface-name = "enp7s0"; 
        };

        ipv4 = {
          method = "manual";
          address1 = "192.168.18.100/24";
          gateway = "192.168.18.1";
          dns = "1.1.1.1;1.0.0.1;";
        };

        ipv6 = {
          method = "disabled";
        };
      };
    };
  };

  # Users
  users.users.${user.name} = {
    isNormalUser = true;
    description = "${user.description}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # Virtualisation
  virtualisation = {
    docker = {
      daemon.settings = {
        data-root = "/run/media/HDD/.docker";
      };
    };

    containers.storage.settings = {
      driver = "overlay";
      graphroot = "/run/media/HDD/.podman";
      runroot = "/run/containers/storage";
    };
  };
}
