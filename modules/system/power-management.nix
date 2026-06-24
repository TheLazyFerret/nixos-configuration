### Enable power management.
{ config, lib, ... }: {
  # Set the options.
  options.modules.powerManagement = {
    enable = lib.mkEnableOption "Enable power management";
    backend = lib.mkOption {
      type = lib.types.enum [
        "tlp"
        "power-profile-daemon"
      ];
      default = "tlp";
      description = "The backed the power management will use";
    };
  };

  config = lib.mkIf (config.modules.powerManagement.enable) (
    lib.mkMerge [
      # tlp backend backend (better for laptops).
      (lib.mkIf (config.modules.powerManagement.backend == "tlp") {
        services.power-profiles-daemon.enable = false; # Disable explicitly ppd.
        services.tlp = {
          enable = true;
          pd.enable = true; # Add a power-profile-daemon interface for desktops.
        };
      })

      # power-profile-daemon backend.
      (lib.mkIf (config.modules.powerManagement.backend == "power-profile-daemon") {
        services.power-profiles-daemon.enable = true;
      })
    ]
  );

}
