### Garbage collector and nix-store optimization settings.

{...}: {
  
  ### Optimize nix store.
  nix.optimise.automatic = true;
  
  ### Automatize nix garbage collection.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };  

}
