### Module that just import all modules.
{...}: {
  imports = [
    ./other/desktop.nix
    ./other/package-sets.nix
    ./other/personal-account.nix
    ./system/bluetooth.nix
    ./system/disable-hibernation.nix
    ./system/garbage-collector.nix
    ./system/keymap.nix
    ./system/localization.nix
    ./system/power-management.nix
    ./system/sound.nix
    ./system/sudo.nix
    ./system/container.nix
  ];
}