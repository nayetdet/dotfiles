{ ... }: {
  boot.blacklistedKernelModules = [ "gspca_kinect" ];

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02ae", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02ad", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02c2", TAG+="uaccess"
  '';
}
