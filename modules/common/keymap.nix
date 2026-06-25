### Set the keymap of the system.
{ lib, config, ... }: {
  # Set the options.
  options.modules = {
    x11 = {
      keymap = lib.mkOption {
        type = lib.types.str;
        description = "The default keymap used in the desktop";
        default = "us";
        example = "us";
      };
      variant = lib.mkOption {
        type = lib.types.str;
        description = "The variant of the keyboard";
        default = "";
        example = "intl";
      };
    };
    console.keymap = lib.mkOption {
      type = lib.types.str;
      description = "The default keymap of the TTY";
      default = "us";
      example = "us";
    };

  };

  config = {
    services.xserver.xkb.layout = config.modules.x11.keymap;
    services.xserver.xkb.variant = config.modules.x11.variant;
    console.keyMap = config.modules.console.keymap;
  };
}
