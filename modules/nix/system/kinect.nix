{ ... }: {
  boot.blacklistedKernelModules = [ "gspca_kinect" ];

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02ae", MODE="0660", GROUP="users", TAG+="uaccess", ATTR{power/control}="on"
    # Audio is unused by the RGB-D pipeline and this device repeatedly resets
    # its audio endpoint, destabilizing the Kinect's internal USB hub.
    SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02ad", ATTR{authorized}="0"
    SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02c2", MODE="0660", GROUP="users", TAG+="uaccess", ATTR{power/control}="on"
  '';
}
