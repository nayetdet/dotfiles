{ self, ... }: {
  home.file.".config/corectrl/profiles/_global_.ccpro".source = self + /config/corectrl/_global_.ccpro;

  xdg.configFile."autostart/corectrl.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=CoreCtrl
    Exec=corectrl --minimize-systray
    Terminal=false
    X-GNOME-Autostart-enabled=true
  '';
}
