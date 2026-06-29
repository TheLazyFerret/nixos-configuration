### Packages a want in a desktop environmnent.
{ lib, config, pkgs, ... }:
let
  cfg = config.customOptions.unfreePackages;
in
{
  options.customOptions.unfreePackages.enable = lib.mkIf "Enable extra unfree desktop packages";
  
  config = lib.mkMerge [
    # Free software.
    {
      environment.systemPackages = with pkgs; [
        zed-editor
        gimp
        starship
      ];

      fonts.packages = with pkgs; [
        inconsolata
        nerd-fonts.inconsolata
      ];

      programs.firefox = {
        enable = true;
        languagePacks = [
          "es-ES"
          "en-US"
        ];
      };
    }
    # Unfree software.
    (lib.mkIf (cfg.enable) {
      environment.systemPackages =  with pkgs; [
        discord
        telegram-desktop
      ];
    })
  ];
}
