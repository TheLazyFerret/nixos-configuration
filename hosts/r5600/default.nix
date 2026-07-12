{ pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
  ];
   
  nixpkgs.config.allowUnfree = true;
  
  customOptions.disableHibernation.enable = true;
  customOptions.unfreePackages.enable = true;

  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "altgr-intl";
  console.keyMap = "en"; 

  networking.hostName = "r5600";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  system.stateVersion = "26.05";

}
