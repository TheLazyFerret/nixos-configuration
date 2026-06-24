### Users configuration.

{config, lib, pkgs, ...}: {

  options.modules.accounts.lazyferret.enable = lib.mkEnableOption "Enable personal account";

  config = lib.mkIf config.modules.accounts.lazyferret.enable {
    # My personal account. 
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
  };

}
