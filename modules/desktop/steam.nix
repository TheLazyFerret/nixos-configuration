### Steam module (Obviously requires nonfree enabled).
{ config, lib, pkgs, ... }:
let
  cfg = config.customOptions.steam;
in
{
  options.customOptions.steam.enable = lib.mkEnableOption "Enable steam";

  config = lib.mkIf (cfg.enable) {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };

    programs.gamescope.enable = true; # Nested compositor.
    programs.gamemode.enable = true; # Optimization on demand.

    environment.systemPackages = with pkgs; [
      mangohud # In game fps and hardware monitor.
    ];
  };

}
