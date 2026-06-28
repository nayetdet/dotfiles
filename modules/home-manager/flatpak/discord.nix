{ pkgs, ... }: {
  services.flatpak.packages = [
    "com.discordapp.Discord"
  ];

  xdg.configFile."autostart/discord.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Discord
    Exec=flatpak run com.discordapp.Discord
    X-GNOME-Autostart-enabled=true
  '';
}
