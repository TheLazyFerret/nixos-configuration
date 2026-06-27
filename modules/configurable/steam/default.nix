### Install steam.
{ lib, config, pkgs, ... }: {
  options.modules.steam.enable = lib.mkEnableOption "Enable steam";

  config = lib.mkIf config.modules.steam.enable {
    # Enable steam.
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };

    # Enable gamescope (nested compositor).
    programs.gamescope.enable = true;

    # Enable gamemode (optimization on demand).
    programs.gamemode.enable = true;

    # Other packages.
    environment.systemPackages = with pkgs; [
      mangohud
    ];
  };
}
