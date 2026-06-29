###
### Thinkpad L14 gen 5 AMD
{ pkgs, ... }: {

  # Imports:
  imports = [
    ./hardware-configuration.nix
  ];

  #nixpkgs.config.allowUnfree = true;

  # Disable hibernation. At least in my tests, the laptop didn't support it.
  customOptions.disableHibernation.enable = true;

  #customOptions.steam.enable = true;

  # Keymap configuration.
  services.xserver.xkb.layout = "es";
  console.keyMap = "es";

  # Hostname.
  networking.hostName = "thinkpad";

  # Suspend fix for thinkpad L14 gen 5 (amd).
  networking.networkmanager.wifi.powersave = false;

  # Use systemd boot.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_6_18;

  # Channel version when the system was installed.
  system.stateVersion = "26.05";
}
