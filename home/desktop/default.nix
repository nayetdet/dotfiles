{ self, host, ... }: {
  imports = [
    (self + /modules/home/default.nix)
    (self + /modules/home/system/exclusive/desktop/corectrl.nix)
  ];

  home.username = host.user.username;
  home.homeDirectory = "/home/${host.user.username}";
  home.stateVersion = host.stateVersion;
}
