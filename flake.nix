{
  description = "System flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26:05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, nixpkgs-unstable, ... }: {
    ### Laptop configuration.
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

    ### Shell for configuring this repo.
    devShells."x86-64-linux".default = nixpkgs-unstable.pkgs.mkShell {
      packages = with nixpkgs-unstable; [
        nil
        nixd
      ];
      inputsFrom = [];
    };
  };
}
