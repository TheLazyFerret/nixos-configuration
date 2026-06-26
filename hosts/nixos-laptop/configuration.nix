### "Inner" system configuration.

{ configurableModulesPath, ... }: {
  
  # Imports:
  imports = [
    ./hardware-configuration.nix
     configurableModulesPath # Configurable modules.
  ];

  # Hostname.
  networking.hostName = "nixos-laptop"; 

  # Modules settings.
  modules = {
    desktopEnv = "gnome";
    container.enable = true;
    container.distrobox.enable = true;
    disableHibernation.enable = true;
    hardware = {
      bluetooth.enable = true;
      sound.enable = true;
      sound.crackingFix.enable = true;
    };
    x11.keymap = "es";
    console.keymap = "es";
    packageSets = {
      develop.enable = true;
      fonts.enable = true;
      extras.enable = true;
    };
  };
  
  # Fix for thinkpad L14 gen 5 (amd).
  networking.networkmanager.wifi.powersave = false; 

  # Channel version when the system was installed.
  system.stateVersion = "26.05";
}
