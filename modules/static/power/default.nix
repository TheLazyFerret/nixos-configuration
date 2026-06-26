### Power management through tlp top-level module.
{ ... }: {
  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    pd.enable = true; #  D-Bus interface org.freedesktop.UPower.PowerProfile using tlp as backend. 
  };
}