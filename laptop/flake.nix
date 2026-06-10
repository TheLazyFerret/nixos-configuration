{
  description = "System flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
  };
  outputs = { self, nixpkgs }: {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
	./hardware-configuration.nix
        ./desktop.nix
      ];
    };
  };
}
