### Gnome desktop module.

{pkgs, ...}: {

  ### X11 configuration.
  services.xserver = {
    enable = false;
    xkb.layout = "es";   
  };
 
  ### Enable gnome desktop.
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

  ### List of additional packages to install.
  environment.systemPackages = with pkgs; [
    resources
  ];
  
  ### Desktop related environment variables.
  environment.sessionVariables = rec {
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };

}
