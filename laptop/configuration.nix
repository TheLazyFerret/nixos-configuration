# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  ### Imports.
  imports = [ ./hardware-configuration.nix ];

  ### Password input feedback.
  security.sudo.extraConfig = "Defaults pwfeedback";

  ### Bluetooth.
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  ### Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ### Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  ### Networking.
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager = {
    enable = true;
    wifi.powersave = false; # Fix for thinkpad L14 gen 5 (amd).
  };

  ### Power management.
  services.power-profiles-daemon.enable = false; # Disable the default power management.
  services.tlp = {
    pd.enable = true; # Enable power-profile-daemon like interface.
    enable = true;
  };
  systemd.targets.hibernate.enable = false; # Disable hibernation.
  systemd.targets.hybrid-sleep.enable = false; # Disable suspend + hibernation.
  systemd.targets.suspend-then-hibernate.enable = false; # Disable suspend, then hibernation

  ### Enable CUPS for printing support.
  services.printing.enable = true;

  ### Timezone.
  time.timeZone = "Atlantic/Canary";

  ### Select internationalisation properties.
  i18n.defaultLocale = "es_ES.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };


  ### X11 options.
  services.xserver = {
    enable = false; # Disable the X11 session. 
    xkb.layout = "es";
  }; 
 
  ### Virtual console configuration. 
  console = {
    packages = [ pkgs.terminus_font ];
    #font = "ter-132n";
    keyMap = "es";
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable gnome desktop.
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    epiphany
    gnome-contacts
    gnome-music
    gnome-weather
    gnome-maps
    simple-scan
    yelp
  ];
  
  # Enable firmware updates through fwupd.
  services.fwupd.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Graphical programs  
    firefox
    zed-editor
    # Terminal uttilities
    vim 
    git
    curl
    fastfetch
    devenv
  ];

  environment.sessionVariables = rec {
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."lazyferret" = {
    isNormalUser = true;
    description = "LazyFerret";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05"; 

}
