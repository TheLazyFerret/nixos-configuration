### Module that just import all modules.
{ ... }: {
  imports = [
    ./container
    ./desktop
    ./disable-hibernation
    ./hardware
    ./keymap
    ./package-sets
  ];
}