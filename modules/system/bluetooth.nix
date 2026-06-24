### Enable the bluetooth.

{config, lib, ...}: {
  
  options.modules.bluetooth.enable = lib.mkEnableOption "Enable bluetooth";

  config = lib.mkIf config.modules.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
  };

};
