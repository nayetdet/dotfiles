{ ... }: {
  boot.blacklistedKernelModules = [ "gspca_kinect" ];

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02ae", MODE="0660", GROUP="users", TAG+="uaccess", ATTR{power/control}="on"
    # RGB-D capture does not use audio. This endpoint resets independently and
    # interrupts the camera's streams on this Kinect's internal USB hub.
    SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02ad", ATTR{authorized}="0"
    SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02c2", MODE="0660", GROUP="users", TAG+="uaccess", ATTR{power/control}="on"
  '';
}
