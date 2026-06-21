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
        ./modules/sound.nix
        ./modules/desktop/gnome.nix
        ./modules/personal-account.nix
        ./modules/garbage-collector.nix
      ];
    };
  };
}
