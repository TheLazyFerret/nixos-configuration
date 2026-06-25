### Module that just import all static modules.
{ ... }: {
  imports = [
    ./static/localization.nix
    ./static/misc.nix
    ./static/nix-optimization.nix
    ./static/personal-account.nix
    ./static/power-management.nix
  ];
}