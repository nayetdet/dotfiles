{ self, ... }: {
  imports = [
    ./hardware.nix
    ./mounts.nix

    (self + /modules/nix/default.nix)
    (self + /modules/nix/system/exclusive/desktop/corectrl.nix)
  ];

  # Networking
  networking.networkmanager.ensureProfiles.profiles = {
    defaultProfile = {
      connection = {
        id = "Wired connection 1";
        type = "ethernet";
        interface-name = "enp7s0";
        autoconnect = true;
      };

      ipv4 = {
        method = "manual";
        address1 = "192.168.0.100/24";
        gateway = "192.168.0.1";
        dns = "9.9.9.9;149.112.112.112;";
      };

      ipv6 = {
        method = "auto";
      };
    };
  };

  # Virtualisation
  virtualisation = {
    docker.daemon.settings.data-root = "/run/media/HDD/.docker";
    containers.storage = {
      settings.storage.driver = "overlay";
      rootful.settings.storage = {
        graphroot = "/run/media/HDD/.podman-root";
        runroot = "/run/containers/storage";
      };
      rootless.settings.storage.graphroot = "/run/media/HDD/.podman";
    };
  };
}
