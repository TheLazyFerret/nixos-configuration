### Full localization (timezone + language) module.
{ config, lib, ... }: {
  # Set the options.
  options.modules.localization = {
    locale = lib.mkOption {
      type = lib.types.enum [
        "Spanish"
        "English"
      ];
      default = "Spanish";
      description = "The language of the system";
    };
    timezone = lib.mkOption {
      type = lib.types.str;
      description = "The timezone of the system";
      example = "America/New_York";
      default = "UTC";
    };
  };

  config = lib.mkMerge [
    # the timezone of the system.
    {
      time.timeZone = config.modules.localization.timezone;
    }
    # Spanish language.
    (lib.mkIf (config.modules.localization.locale == "Spanish") {
      i18n.defaultLocale = "es_ES.UTF-8";
      i18n.extraLocaleSettings = {
        LC_ADDRESS = "es_ES.UTF-8";
        LC_IDENTIFICATION = "es_ES.UTF-8";
        LC_MEASUREMENT = "es_ES.UTF-8";
        LC_MONETARY = "es_ES.UTF-8";
        LC_NAME = "es_ES.UTF-8";
        LC_NUMERIC = "es_ES.UTF-8";
        LC_PAPER = "es_ES.UTF-8";
        LC_TELEPHONE = "es_ES.UTF-8";
        LC_TIME = "es_ES.UTF-8";
      };
    })
    # English language.
    (lib.mkIf (config.modules.localization.locale == "English") {
      i18n.defaultLocale = "en_US.UTF-8";
      i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
      };
    })
  ];
}
