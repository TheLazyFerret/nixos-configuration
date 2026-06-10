# "Inner" system configuration.

{ config, pkgs, ... }: {

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

  ### Enable firmware updates through fwupd.
  services.fwupd.enable = true;

  ### Networking.
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager = {
    enable = true;
    wifi.powersave = false; # Fix for thinkpad L14 gen 5 (amd).
  };

  ### Power management configuration.
  services.power-profiles-daemon.enable = false; 
  services.tlp = {
    enable = true;
    pd.enable = true; 
  };

  ### Systemd configuration.
  systemd.targets.hibernate.enable = false; 
  systemd.targets.hybrid-sleep.enable = false;
  systemd.targets.suspend-then-hibernate.enable = false;

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

  ### Virtual console configuration. 
  console = {
    packages = [ pkgs.terminus_font ];
    #font = "ter-132n";
    keyMap = "es";
  };

  ### Enable podman.
  virtualisation.podman = {
      enable = true;
      dockerCompat = true;
  };

  ### Enable dynamic linker loader
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [

    ];
  };

  ### List packages installed in system profile. 
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
    distrobox
    starship
    nixd
    nil
  ];
 
  ### Installed fonts.
  fonts.packages = with pkgs; [
    inconsolata
    nerd-fonts.inconsolata
  ];

  ### Define a user account. 
  users.users."lazyferret" = {
    isNormalUser = true;
    description = "LazyFerret";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes"  ];

  system.stateVersion = "26.05";
}
