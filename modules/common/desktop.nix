### Desktop selector.
{ lib, config, pkgs, ... }: {
  # Set the options.
  options.modules.desktopEnv = lib.mkOption {
    type = lib.types.enum [
      "gnome"
      "kde-plasma"
      ""
    ];
    default = ""; # No desktop by default.
    description = "Desktop environment to install in the system";
    example = "gnome";
  };

  config = lib.mkMerge [
    # GNOME desktop.
    (lib.mkIf (config.modules.desktopEnv == "gnome")
    {
      # Disable X11 Session.
      services.xserver.enable = false; 
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

      # List of additional packages to install (that I consideer "part" of the gnome desktop).
      environment.systemPackages = with pkgs; [
        resources
      ];
    })
  ];
}
