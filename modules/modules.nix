### Module that just import all modules.
{ ... }: {
  imports = [
    ./services/container.nix
    ./common/desktop.nix
    ./common/disable-hibernation.nix
    ./common/hardware.nix
    ./common/keymap.nix
    ./common/package-sets.nix
  ];
}
