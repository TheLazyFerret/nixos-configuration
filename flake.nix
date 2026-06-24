{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, nixpkgs-unstable, ... }:
    let
      system = "x86_64-linux";
      pkgs-unstable = nixpkgs-unstable.legacyPackages."x86_64-linux";
    in
    {
      ### Laptop configuration.
      nixosConfigurations."nixos-laptop" = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/nixos-laptop/configuration.nix
        ];
        specialArgs = {
          repoRoot = ./.;
        };
        
      };

      ### Shell for configuring this repo.
      devShells.${system}.default = pkgs-unstable.mkShell {
        packages = with pkgs-unstable; [
          nil
          nixd
        ];
        inputsFrom = [ ];
      };
    };
}
