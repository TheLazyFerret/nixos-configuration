### Ryzen 5 5600 desktop.
{ pkgs, ... }: {

  # Imports.
  imports = [
    ./hardware-configuration.nix
  ];

  # Enable free packages.
  nixpkgs.config.allowUnfree = true;

  # Gaming options.
  customOptions.steam.enable = true;
  customOptions.prismlauncher.enable = true;
  
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

  # Systemd boot.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel to use.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Channel version when the system was installed.
  system.stateVersion = "26.05";

}
