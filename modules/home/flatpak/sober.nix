{ ... }: {
  services.flatpak.packages = [
    "org.vinegarhq.Sober"
  ];

  services.flatpak.overrides = {
    "org.vinegarhq.Sober" = {
      Context = {
        sockets = [
          "!wayland"
          "x11"
          "pulseaudio"
        ];
      };
    };
  };
}
