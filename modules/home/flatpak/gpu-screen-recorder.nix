{ ... }: {
  xdg.configFile."autostart/gpu-screen-recorder.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=GPU Screen Recorder
    Exec=flatpak run com.dec05eba.gpu_screen_recorder
    X-GNOME-Autostart-enabled=true
  '';
}
