### Ryzen 5 5600 desktop.
{ pkgs, ... }: {

  # Imports.
  imports = [
    ./hardware-configuration.nix
  ];

  # Enable free packages.
  nixpkgs.config.allowUnfree = true;

  # Gaming options.
  customOptions.gaming.enable = true;

  # Disable hibernation.
  customOptions.disableHibernation.enable = true;

  # Enable extra custom nonfree packages.
  customOptions.unfreePackages.enable = true;

  # Keymap configuration.
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "altgr-intl";
  console.keyMap = "en";

  # Hostname.
  networking.hostName = "r5600";

  # Enable printing.
  services.printing.enable = true;

  # Systemd boot.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel to use.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Workaround for board B550 AORUS ELITE V2.
  # See: https://wiki.archlinux.org/title/Power_management/Wakeup_triggers#Instantaneous_wakeup_after_suspending
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="pci", DRIVER=="pcieport", ATTR{power/wakeup}="disabled"
  '';

  # Channel version when the system was installed.
  system.stateVersion = "26.05";

}
