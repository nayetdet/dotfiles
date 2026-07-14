{ user, config, lib, ... }:
let
  rootfullStoragePath = config.virtualisation.containers.storage.settings.storage.graphroot or null;
  rootlessStoragePath = config.virtualisation.containers.storage.settings.storage.rootless_storage_path or null;
in
{
  virtualisation.podman = {
    enable = true;
    dockerCompat = false;
  };

  systemd.tmpfiles.rules =
    (lib.optionals (rootfullStoragePath != null) [
      "d ${rootfullStoragePath} 0700 root root -"
      "z ${rootfullStoragePath} 0700 root root -"
    ])
    ++ (lib.optionals (rootlessStoragePath != null) [
      "d ${rootlessStoragePath} 0700 ${user.name} users -"
      "z ${rootlessStoragePath} 0700 ${user.name} users -"
    ]);

  systemd.services.podman.unitConfig.RequiresMountsFor =
    lib.filter (path:
      path != null
      && path != "/var/lib/containers/storage"
      && path != "/var/lib/containers/storage-rootless"
    ) [
      rootfullStoragePath
      rootlessStoragePath
    ];
}
