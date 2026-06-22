{
  description = "System flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
  };
  outputs = { self, nixpkgs }: {
    nixosConfigurations."nixos-laptop" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system/nixos-laptop/configuration.nix
        ./modules/common/sound.nix              # Pipewire configuration.
        ./modules/common/personal-account.nix   # My personal account settings.
        ./modules/common/garbage-collector.nix  # Garbage collection and nix store optimization.
        ./modules/desktop/desktop.nix           # Desktop selector.
      ];
    };
  };
}
