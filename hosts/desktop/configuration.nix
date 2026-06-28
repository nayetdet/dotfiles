{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./mount-configuration.nix
    ../../modules/nixos/default.nix
    ../../modules/nixos/docker.nix
    ../../modules/nixos/gnome.nix
    ../../modules/nixos/nautilus.nix
    ../../modules/nixos/podman.nix
  ];

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
  users.users.nayetdet = {
    isNormalUser = true;
    description = "João Pedro Moreira";
    extraGroups = [
      "docker"
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

  # Services
  services.flatpak.enable = true;
}
