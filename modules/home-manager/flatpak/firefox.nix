{ pkgs, ... }: {
  services.flatpak.packages = [
    "org.mozilla.firefox"
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "org.mozilla.firefox.desktop";
      "application/xhtml+xml" = "org.mozilla.firefox.desktop";
      "text/html" = "org.mozilla.firefox.desktop";
      "x-scheme-handler/http" = "org.mozilla.firefox.desktop";
      "x-scheme-handler/https" = "org.mozilla.firefox.desktop";
    };
  };
}
