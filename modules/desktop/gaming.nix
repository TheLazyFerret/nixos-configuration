### Steam module (Obviously requires nonfree enabled).
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.customOptions;
in
{
  options.customOptions = {
    steam.enable = lib.mkEnableOption "Enable steam";
    prismlauncher.enable = lib.mkEnableOption "Enable prism launcher";
  };

  config = lib.mkMerge [
    ### Steam configuration.
    (lib.mkIf (cfg.steam.enable) {
      programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
      };

      programs.gamescope.enable = true; # Nested compositor.
      programs.gamemode.enable = true; # Optimization on demand.

      environment.systemPackages = with pkgs; [
        mangohud # In game fps and hardware monitor.
      ];
    })
    ### Prism launcher configuration.
    (lib.mkIf (cfg.prismlauncher.enable) {
      environment.systemPackages = with pkgs; [
        prismlauncher
      ];
    })
  ];

}
