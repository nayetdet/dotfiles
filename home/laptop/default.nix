{ self, ... }: {
  imports = [
    (self + /modules/home/default.nix)
  ];
}
