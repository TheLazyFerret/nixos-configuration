###
{ config, lib, ... }:
let
  cfg = config.customOptions.sound.crackingFix;
in
{
  options.customOptions.sound.crackingFix.enable = lib.mkEnableOption "Enable cracking fix if needed";

  config = lib.mkMerge [
    # Enable pipewire.
    {
      services.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
    }
    # Custom option.
    (lib.mkIf cfg.enable {
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
