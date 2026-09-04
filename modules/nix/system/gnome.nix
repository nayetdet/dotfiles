{ self, host, pkgs, ... }:
let
  accountsServiceUser = pkgs.writeText "accountsservice-${host.user.name}" ''
    [User]
    Icon=/var/lib/AccountsService/icons/${host.user.name}
  '';
in {
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome.core-apps.enable = false;
  };

  systemd.tmpfiles.rules = [
    "L+ /var/lib/AccountsService/icons/${host.user.name} - - - - ${self}/assets/avatars/${host.id}.png"
    "L+ /var/lib/AccountsService/users/${host.user.name} - - - - ${accountsServiceUser}"
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];
}
