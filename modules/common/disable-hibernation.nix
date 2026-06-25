### Disable the hibernation through systemd targets.
{ lib, config, ... }: {
  # Set the options.
  options.modules.disableHibernation.enable = lib.mkEnableOption "Disable the hibernation";

  config = lib.mkIf (config.modules.disableHibernation.enable) {
    systemd.targets.hibernate.enable = false; 
    systemd.targets.hybrid-sleep.enable = false;
    systemd.targets.suspend-then-hibernate.enable = false;
  };
}