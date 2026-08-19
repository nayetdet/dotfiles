{ ... }: {
  boot.blacklistedKernelModules = [ "gspca_kinect" ];

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02ae", MODE="0660", GROUP="users", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02ad", MODE="0660", GROUP="users", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02c2", MODE="0660", GROUP="users", TAG+="uaccess"
  '';
}
