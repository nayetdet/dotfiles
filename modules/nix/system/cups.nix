{ host, ... }: {
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  users.users.${host.user.name}.extraGroups = [
    "lpadmin"
  ];
}
