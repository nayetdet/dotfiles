{ self, host, pkgs, ... }: {
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome.core-apps.enable = false;
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];

  systemd.tmpfiles.rules = [
    "L+ /var/lib/AccountsService/icons/${host.user.username} - - - - ${self}/assets/avatar.png"
    "f+ /var/lib/AccountsService/users/${host.user.username} 0644 root root - [User]\\nIcon=/var/lib/AccountsService/icons/${host.user.username}"
  ];
}
