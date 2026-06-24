### Garbage collector and nix-store optimization settings.

{lib, config, ...}: {
  
  options.modules.nixOptimization.enable = lib.mkEnableOption "Enable nixos garbage collection and optimization";

  config = lib.mkIf config.modules.nixOptimization.enable {
    # Optimize nix store.
    nix.optimise.automatic = true;
  
    # Automatize nix garbage collection.
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };  
  };
}
