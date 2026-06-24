### Users configuration.
{config, lib, pkgs, ...}: 
let 
  username = "lazyferret";
  fullname = "LazyFerret";
in
{
  # Set the options.
  options.modules.accounts."${username}".enable = lib.mkEnableOption "Enable personal account";

  config = lib.mkIf (config.modules.accounts.lazyferret.enable) {
    # My personal account. 
    users.users."${username}" = {
      isNormalUser = true;
      description = "${fullname}"; #  User full name.
      extraGroups = [ "networkmanager" "wheel" ];
      # User only packages (Most of them are graphical applications).
      packages = with pkgs; [
        firefox # Web browser.
        zed-editor # Personal code editor.
        gimp # Image editor.
      
        starship # cool shell :)
      ];
    };
  };

}
