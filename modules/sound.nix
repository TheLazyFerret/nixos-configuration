### Sound module.

{pkgs, lib, config, ...}: {
  
  services.pulseaudio.enable = false; # Disable pulseaudio.
  security.rtkit.enable = true; # Enable realtime scheduling on demand.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  ### Variable declarations.
  options = {
    cracking-fix.enable = lib.mkEnableOption "Enable some configurations for pipewire to reduce crackling sound";

  };

  ### Assign values to the variables.
  config = mkIf config.cracking-fix.enable {
    services.pipewire.extraConfig.pipewire."10-cracking" = {
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
