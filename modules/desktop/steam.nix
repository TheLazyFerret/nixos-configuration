### Steam module (Obviously requires nonfree enabled).
{ pkgs, ... }: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  programs.gamescope.enable = true; # Nested compositor.
  programs.gamemode.enable = true; # Optimization on demand.

  environment.systemPackages = with pkgs; [
    mangohud # In game fps and hardware monitor.
  ];
}