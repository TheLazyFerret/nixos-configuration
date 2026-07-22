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
  options.customOptions.gaming.enable = lib.mkEnableOption "Enable and install gaming stuff";

  config = lib.mkIf (cfg.gaming.enable) {
    programs.steam = {
      enable = true; # Main gaming platform.
      remotePlay.openFirewall = true;
    };

    programs.gamescope.enable = true; # Nested compositor.
    programs.gamemode.enable = true; # Optimization on demand.

    environment.systemPackages = with pkgs; [
      mangohud # In game fps and hardware monitor.
      prismlauncher # Minecraft launcher.

      heroic # Launcher for games outside of steam.
    ];
  };

}
