### Packages installed in the system.

{ config, pkgs, ...}: {

  # List packages installed in system profile. 
  environment.systemPackages = with pkgs; [
    vim 
    git
    curl
    fastfetch
  ];
 
  # Installed fonts.
  fonts.packages = with pkgs; [
    inconsolata
    nerd-fonts.inconsolata
  ];

}
