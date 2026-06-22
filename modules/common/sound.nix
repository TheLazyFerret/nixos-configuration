### Sound module.

{pkgs, lib, config, ...}: {

  # Creates an option setting.
  options = {
    crackingFix.enable = lib.mkEnableOption "Enable some configurations for pipewire to reduce crackling sound";

  };

  # Assign values to the variables.
  config = {
    # -- Always evaluates.
    services.pulseaudio.enable = false; # Disable pulseaudio.
    security.rtkit.enable = true; # Enable realtime scheduling on demand.
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    # --!

    # Configuration if the option is enabled.
    services.pipewire.extraConfig.pipewire."10-cracking" = lib.mkIf config.crackingFix.enable {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.allowed-rates" = [ 48000 ];
        "default.clock.quantum" = 800;
        "default.clock.min-quantum" = 512;
        "default.clock.max-quantum" = 1024;
      };
    }; 
  };
 
}
