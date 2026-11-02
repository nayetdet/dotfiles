{ self, host, ... }: {
  imports = [
    (self + /modules/home/default.nix)
  ];

  home.username = host.user.username;
  home.homeDirectory = "/home/${host.user.username}";
  home.stateVersion = host.stateVersion;
}
