{ host, ... }:
{
  security = {
    sudo.enable = false;
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
      extraConfig = "Defaults !pwfeedback";
      wheelNeedsPassword = true;
    };
  };

  users.users.${host.user.username}.extraGroups = [ "wheel" ];
}
