### Disable the hibernation through systemd targets.
{ lib, config, ... }:
let
  cfg = config.customOptions.disableHibernation;
in
{
  options.customOptions.disableHibernation.enable = lib.mkEnableOption "Disable the hibernation";

  config = lib.mkIf (cfg.enable) {
    systemd.targets.hibernate.enable = false;
    systemd.targets.hybrid-sleep.enable = false;
    systemd.targets.suspend-then-hibernate.enable = false;
  };
}
