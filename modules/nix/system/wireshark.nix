{ host, pkgs, ... }: {
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  users.users.${host.user.username}.extraGroups = [
    "wireshark"
  ];
}
