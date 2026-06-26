{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { nixpkgs, nixpkgs-unstable, ... }:
    let
      system = "x86_64-linux";
      pkgs-unstable = nixpkgs-unstable.legacyPackages."x86_64-linux";
    in
    {
      ### Laptop configuration.
      nixosConfigurations."nixos-laptop" = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./modules/static
          ./hosts/nixos-laptop/configuration.nix
        ];
        specialArgs = {
          configurableModulesPath = ./modules/configurable;
        };
        
      };

      ### Shell for configuring this repo.
      devShells.${system}.default = pkgs-unstable.mkShell {
        packages = with pkgs-unstable; [
          nil
          nixd
          nixfmt
        ];
        inputsFrom = [ ];
      };
    };
}
