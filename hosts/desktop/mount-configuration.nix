{ pkgs, ... }: {
  fileSystems."/run/media/HDD" = {
    device = "/dev/disk/by-uuid/85aa32eb-672c-423d-9428-57d7e28d0525";
    fsType = "ext4";
    options = [
      "discard"
      "users"
      "nofail"
      "noatime"
      "x-systemd.automount"
    ];
  };

  fileSystems."/run/media/SSD" = {
    device = "/dev/disk/by-uuid/34063fba-ef9a-4f0a-927c-022222f5696f";
    fsType = "ext4";
    options = [
      "discard"
      "users"
      "nofail"
      "noatime"
      "x-systemd.automount"
    ];
  };
}
