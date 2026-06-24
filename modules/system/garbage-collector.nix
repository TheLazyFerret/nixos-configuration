### Periodic garbage collector and nix-store optimization.

{ lib, config, ... }: {
  # Set the options.
  options.modules.nixOptimization.enable = lib.mkEnableOption "Enable nixos garbage collection and optimization";

  config = lib.mkIf (config.modules.nixOptimization.enable) {
    nix = {
      optimise.automatic = true; # Optimize nix store automatically.
      gc = {
        automatic = true; # Automatic garbage collection.
        dates = "weekly";
        options = "--delete-older-than 30d"; 
      };
    };
  };
}
