### Gnome desktop environment.
{ pkgs, ... }: {
  services.xserver = {
    enable = false; # Disable X11 session.
  };

  services.displayManager.gdm.enable = true; 
  
  services.desktopManager.gnome.enable = true;

  # Packages to not install from the default gnome installation.
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

  # Extra packages that I consider part of the desktop
  environment.systemPackages = with pkgs; [
    resources
  ];

}