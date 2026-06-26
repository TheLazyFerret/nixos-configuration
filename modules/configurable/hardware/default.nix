### Hardware toggleable configurations.
{ config, lib, ... }: {
  options.modules.hardware = {
    bluetooth.enable = lib.mkEnableOption "Enable bluetooth";
    sound.enable = lib.mkEnableOption "Enable pipewire";
    sound.crackingFix.enable = lib.mkEnableOption "Enable personal cracking fix";
  };

  config = lib.mkMerge [
    (lib.mkIf (config.modules.hardware.bluetooth.enable) {
      hardware.bluetooth.enable = true;
      hardware.bluetooth.powerOnBoot = false;
    })
    (lib.mkIf (config.modules.hardware.sound.enable) {
      services.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = false; # Avoid building (change to true in a few days).
        pulse.enable = true;
      };
    })
    (lib.mkIf (config.modules.hardware.sound.enable && config.modules.hardware.sound.crackingFix.enable) {
      services.pipewire.extraConfig.pipewire."10-cracking-fix" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.allowed-rates" = [ 48000 ];
          "default.clock.quantum" = 800;
          "default.clock.min-quantum" = 512;
          "default.clock.max-quantum" = 1024;
        };
      };
    })
  ];
}
