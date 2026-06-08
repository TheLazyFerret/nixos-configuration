### Desktop configuration.

{config, pkgs, ...}: {

  ### Sound configuration.  
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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
  
  ### Desktop related environment variables.
  environment.sessionVariables = rec {
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };

}
