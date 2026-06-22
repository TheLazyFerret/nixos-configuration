# Users configuration.

{pkgs, ...}: {

  ### My personal account. 
  users.users."lazyferret" = {
    isNormalUser = true;
    description = "LazyFerret";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      zed-editor
      gimp
      
      starship
      distrobox
    ];
  };

}
