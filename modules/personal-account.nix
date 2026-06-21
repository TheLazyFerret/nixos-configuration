# Users configuration.

{config, pkgs, ...}: {

  ### My personal account. 
  users.users."lazyferret" = {
    isNormalUser = true;
    description = "LazyFerret";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

}
