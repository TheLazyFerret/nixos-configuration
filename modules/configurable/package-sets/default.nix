### Package sets to install.
{ lib, config, pkgs, ... }: {
  # Set the options.
  options.modules.packageSets = {
    basic.enable = lib.mkEnableOption "";
    develop.enable = lib.mkEnableOption "Install basic development packages";
    fonts.enable = lib.mkEnableOption "Install additional fonts";
    extras.enable = lib.mkEnableOption "Install extra packages";
  };

  config = lib.mkMerge [
    # Basic development packages.
    (lib.mkIf (config.modules.packageSets.develop.enable) {
      environment.systemPackages =  with pkgs; [
        curl
        nmap
        zed-editor
        starship
      ];
    })
    # Fonts packages.
    (lib.mkIf (config.modules.packageSets.fonts.enable) {
      fonts.packages = with pkgs; [
        inconsolata
        nerd-fonts.inconsolata
      ];
    })
    # Extra graphical packages.
    (lib.mkIf (config.modules.packageSets.extras.enable) {
      environment.systemPackages = with pkgs; [
        gimp
        firefox
      ];
    })
  ];
}
