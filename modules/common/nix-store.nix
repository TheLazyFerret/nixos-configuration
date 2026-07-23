### Periodic garbage collection and nix-store optimization.
{ ... }: {
  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
    persistent = true; # https://github.com/NixOS/nixpkgs/blob/nixos-26.05/nixos/modules/services/misc/nix-optimise.nix
  };

  nix.gc = {
    automatic = true;
    dates = "monthly";
    persistent = true;
  };
}
