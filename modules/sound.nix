### Sound module.

{pkgs, lib, config, ...}: {

  # Creates an option setting.
  options.modules = {
    sound.enable = lib.mkEnableOption "Enable pipewire sound server";
    sound.crackingFix.enable = lib.mkEnableOption "Enable some configurations for pipewire to reduce crackling sound";

  };

  # Assign values to the variables.
  config = lib.mkIf config.modules.sound.enable {
    # Enable the pipewire sound server.
    services.pulseaudio.enable = false; # Disable pulseaudio.
    security.rtkit.enable = true; # Enable realtime scheduling on demand.
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Configuration if the extra option is enabled
    services.pipewire.extraConfig.pipewire."10-cracking" = lib.mkIf config.modules.sound.crackingFix.enable {
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
