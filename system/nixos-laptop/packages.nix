# Packages installed in the system.

{ config, pkgs, ...}: {

  ### List packages installed in system profile. 
  environment.systemPackages = with pkgs; [
    # Graphical programs  
    firefox
    zed-editor
    gimp
    resources
    # Terminal uttilities
    vim 
    git
    curl
    fastfetch
    devenv
    distrobox
    starship
  ];
 
  ### Installed fonts.
  fonts.packages = with pkgs; [
    inconsolata
    nerd-fonts.inconsolata
  ];

}
