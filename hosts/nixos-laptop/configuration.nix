### "Inner" system configuration.

{ repoRoot, pkgs, ... }: {
  
  # Imports:
  imports = [
    ./hardware-configuration.nix
    (repoRoot + /modules/modules.nix)
  ];

  # Hostname.
  networking.hostName = "nixos-laptop"; 

  # Modules settings.
  modules = {
    desktopEnv = "gnome"; # The desktop environment to enable.
    accounts."lazyferret".enable = true; # Personal account.
    # Package sets.
    packages = {
      develop.enable = true;
      fonts.enable = true;
      extras.enable = true;
    };
    bluetooth.enable = true; # Bluetooth.
    container.enable = true; # Enable podman container (Rootless by default).
    container.distrobox.enable = true; # Enable distrobox.
    disableHibernation.enable = true; # Disable hibernation (not working on thinkpad L14 amd gen 5).
    nixOptimization.enable = true; # Periodic nix store optimization and garbage collector.
    x11.keymap = "es"; # Default keymap for desktop environments (not only for X11).
    console.keymap = "es"; # TTY keymap
    localization = {
      locale = "Spanish"; # Language of the system.
      timezone = "Atlantic/Canary"; # Timezone of the system.
    };
    powerManagement.enable = true; # Enable power management (through TLP).
    sound.enable = true; # Enable explicitly pipewire sound server.
    sudo.feedback.enable = true; # Enable feedback typing password.
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable firmware updates through fwupd.
  services.fwupd.enable = true;

  # Enable network manager.
  networking.networkmanager = {
    enable = true;
    wifi.powersave = false; # Fix for thinkpad L14 gen 5 (amd).
  };

  # Enable dynamic linker loader.
  programs.nix-ld.enable = true;

  # Enable flakes.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Version when the system was installed (not the current channel!).
  system.stateVersion = "26.05";
}
