###
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
      nixosConfigurations."thinkpad" = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/thinkpad
          ./modules/common
          ./modules/desktop
        ];
      };
      
      nixosConfigurations."r5600" = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/r5600
          ./modules/common
	  ./modules/desktop
        ];
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
