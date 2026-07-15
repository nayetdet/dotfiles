{ self, host, pkgs, ... }: {
  imports = [
    ./hardware.nix
    ./mounts.nix

    (self + /modules/nix/default.nix)
    (self + /modules/nix/flatpak/gpu-screen-recorder.nix)
    (self + /modules/nix/system/app-image.nix)
    (self + /modules/nix/system/corectrl.nix)
    (self + /modules/nix/system/cups.nix)
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
  system.stateVersion = host.stateVersion;

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
          address1 = "192.168.0.100/24";
          gateway = "192.168.0.1";
          dns = "1.1.1.1;1.0.0.1;";
        };

        ipv6 = {
          method = "disabled";
        };
      };
    };
  };

  # Users
  users.users.${host.user.name} = {
    isNormalUser = true;
    description = "${host.user.description}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # Virtualisation
  virtualisation = {
    docker.daemon.settings.data-root = "/run/media/HDD/.docker";
    containers.storage.settings.storage = {
      driver = "overlay";
      graphroot = "/run/media/HDD/.podman-root";
      rootless_storage_path = "/run/media/HDD/.podman";
      runroot = "/run/containers/storage";
    };
  };
}
