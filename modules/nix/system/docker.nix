{ host, config, lib, ... }:
let
  storagePath = config.virtualisation.docker.daemon.settings."data-root" or null;
in {
  virtualisation.docker.enable = true;

  users.users.${host.user.name}.extraGroups = [
    "docker"
  ];

  systemd.tmpfiles.rules = lib.optionals (storagePath != null) [
    "d ${storagePath} 0700 root root -"
    "z ${storagePath} 0700 root root -"
  ];

  systemd.services.docker.unitConfig.RequiresMountsFor =
    lib.mkIf (storagePath != null && storagePath != "/var/lib/docker") storagePath;
}
