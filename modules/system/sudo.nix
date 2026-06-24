### Extra configuration to sudo.
{ lib, config, ... }: {
  # Set the options.
  options.modules.sudo = {
    feedback.enable = lib.mkEnableOption "Enable feedback when typing the password";
  };

  config = lib.mkIf (config.modules.sudo.feedback.enable) {
    security.sudo.extraConfig = lib.mkAfter "Defaults pwfeedback";
  };
}
