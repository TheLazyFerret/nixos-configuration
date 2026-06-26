# Nixos configuration.
My personal [nixOS](https://nixos.org/) configuration.

## Proyect structure.
- [flake.nix](./flake.nix): Declarative version-pinned dependencies.
- [hosts](./host): Main configuration of each host. 
- [Modules/configurable](./modules/configurable): Diverse configurable modules.
- [Modules/static](./modules/static): Top level, not configurable modules designed to be imported directly into `flake.nix`

## Commands remainder.
- `nix flake update`: Update the flake.lock. Requires a rebuild to update the system.
- `nixos-rebuild switch --flake .` Build the configuration, activate it and creates a new boot entry.

## License.
Proyect licensed under the [MIT](./LICENSE) license.
