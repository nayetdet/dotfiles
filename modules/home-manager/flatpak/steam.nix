{ ... }: {
  services.flatpak.packages = [
    "com.valvesoftware.Steam"
  ];

  services.flatpak.overrides."com.valvesoftware.Steam" = {
    Context.filesystems = [
      "/run/media:rw"
    ];
  };

  xdg.configFile."autostart/steam.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Steam
    Exec=flatpak run com.valvesoftware.Steam
    X-GNOME-Autostart-enabled=true
  '';
}
