### My personal user :3
{ ... }: {
  users.users."lazyferret" = {
    isNormalUser = true;
    description = "LazyFerret";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
