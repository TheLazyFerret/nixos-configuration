### User declaration as a top-level module.
{ ... }: {
  users.users."lazyferret" = {
    isNormalUser = true;
    description = "LazyFerret";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = [ ];
  };
}
