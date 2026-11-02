{ self, host, pkgs, ... }: {
  imports = [
    (self + /modules/nix/system/appimage.nix)
    (self + /modules/nix/system/cups.nix)
    (self + /modules/nix/system/dialout.nix)
    (self + /modules/nix/system/docker.nix)
    (self + /modules/nix/system/fail2ban.nix)
    (self + /modules/nix/system/flatpak.nix)
    (self + /modules/nix/system/gnome.nix)
    (self + /modules/nix/system/libvirt.nix)
    (self + /modules/nix/system/packet-tracer.nix)
    (self + /modules/nix/system/podman.nix)
    (self + /modules/nix/system/scrcpy.nix)
    (self + /modules/nix/system/ssh.nix)
    (self + /modules/nix/system/tailscale.nix)
    (self + /modules/nix/system/wireshark.nix)
  ];

  # System
  system.stateVersion = host.stateVersion;
  documentation.nixos.enable = false;

  # Nix
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Bootloader & Kernel
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Networking
  networking.hostName = "nixos";
  networking.firewall.enable = true;
  networking.networkmanager.enable = true;

  # Locale & Keyboard
  console.keyMap = "br-abnt2";
  services.xserver.xkb.layout = "br";
  services.xserver.xkb.variant = "abnt2";
  time.timeZone = "America/Fortaleza";

  # Users
  users.users.${host.user.username} = {
    isNormalUser = true;
    description = host.user.name;
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # Programs
  programs.dconf.enable = true;
  programs.zsh.enable = true;

  # Services
  services.fstrim.enable = true;
  services.smartd.enable = true;
}
