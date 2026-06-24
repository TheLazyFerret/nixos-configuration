### Enable power managment.

{config, lib, ...}: {


  options.modules.power-management = lib.mkOption {
    type = lib.types.enum [
      "power-profiles-daemon"
      "tlp"
    ];
  };

  config = {
    # power-profiles-daemon.
    services.power-profiles-daemon.enable = lib.mkIf (config.modules.power-management == "power-profiles-daemon");

    # tlp.
    services.tlp = lib.mkIf (config.modules.power-management == "tlp") {
      enable = true;
      pd.enable = true;
    };
  };

};
