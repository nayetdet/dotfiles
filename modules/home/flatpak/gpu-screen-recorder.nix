{ ... }: {
  xdg.configFile."autostart/gpu-screen-recorder.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=GPU Screen Recorder
    Exec=flatpak run --command=gsr-ui com.dec05eba.gpu_screen_recorder
    NoDisplay=true
    X-GNOME-Autostart-enabled=true
    StartupNotify=false
  '';
}
