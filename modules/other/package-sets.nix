### Package sets to install.
{ lib, config, pkgs, ... }: {
  # Set the options.
  options.modules.packages = {
    develop.enable = lib.mkEnableOption "Install basic development packages";
    fonts.enable = lib.mkEnableOption "Install additional fonts";
    extras.enable = lib.mkEnableOption "Install extra packages";
  };

  config = lib.mkMerge [
    # Basic development packages.
    (lib.mkIf (config.modules.packages.develop.enable) {
      environment.systemPackages =  with pkgs; [
        vim
        git
        curl
        nmap
      ];
    })
    # Fonts packages.
    (lib.mkIf (config.modules.packages.fonts.enable) {
      fonts.packages = with pkgs; [
        inconsolata
        nerd-fonts.inconsolata
      ];
    })
    # Extra packages.
    (lib.mkIf (config.modules.packages.extras.enable) {
      environment.systemPackages = with pkgs; [
        fastfetch
      ];
    })
  ];
}