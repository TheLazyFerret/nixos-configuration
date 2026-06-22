### Desktop selector.

{lib, config, ...}: {

  # import the desktop configuration functions.
  imports = [
    ./_desktop-env/gnome.nix
    ./_desktop-env/kde-plasma.nix
  ];

  # Create an option.
  options.desktop.desktop-env = lib.mkOption {
      type = lib.types.enum [
        "gnome"
        "kde-plasma"
      ];
      default = ""; # No desktop by default.
      description = "Desktop environment to install";
  };



}
