# Nixos configuration.
My personal [nixOS](https://nixos.org/) configuration.

## Proyect structure.
- [System](./system): Main configuration of each host.
- [Modules](./modules): Reusable configurations between the hosts.

## Commands remainder.
- `nix flake update`: Update the flake.lock. Requires a rebuild to update the system.
- `nixos-rebuild switch --flake .` Build the configuration, activate it and creates a new boot entry.

## License.
Proyect licensed under the [MIT](./LICENSE) license.
