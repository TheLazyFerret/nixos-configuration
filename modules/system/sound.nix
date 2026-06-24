### Sound module.
{ config, lib, ... }: {
  # Set the options.
  options.modules.sound = {
    enable = lib.mkEnableOption "Enable pipewire sound configuration";
    crackingFix.enable = lib.mkEnableOption "Enable opinionated cracking fix";
  };

  config = lib.mkIf (config.modules.sound.enable) (
    lib.mkMerge [
      # Enable pipewire.
      {
        services.pulseaudio.enable = false;
        security.rtkit.enable = true;
        services.pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = false; # Avoid building (change to true in a few days).
          pulse.enable = true;
        };
      }
      # (Optional) enable a opinionated craking fix, specially for gaming.
      (lib.mkIf (config.modules.sound.crackingFix.enable) {
        services.pipewire.extraConfig.pipewire."10-cracking" =
          lib.mkIf config.modules.sound.crackingFix.enable
            {
              "context.properties" = {
                "default.clock.rate" = 48000;
                "default.clock.allowed-rates" = [ 48000 ];
                "default.clock.quantum" = 800;
                "default.clock.min-quantum" = 512;
                "default.clock.max-quantum" = 1024;
              };
            };
      })
    ]
  );
}
