{ self, ... }: {
  imports = [
    (self + /modules/home/default.nix)
    (self + /modules/home/system/exclusive/desktop/corectrl.nix)
  ];
}
