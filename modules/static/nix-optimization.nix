### Periodic garbage collector and nix-store optimization top-level module.
{ ... }: {
  nix = {
    optimise = {
      automatic = true;
      dates = [ "daily" ];
      persistent = true; # See https://github.com/NixOS/nixpkgs/blob/nixos-26.05/nixos/modules/services/misc/nix-optimise.nix
    };
    gc = {
      automatic = true;
      dates = "weekly";
      persistent = true;
    };
  };
}
