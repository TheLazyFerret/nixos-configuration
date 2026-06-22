### Desktop selector.

{lib, config, ...}: {

  import = [
    ./_desktop-env/gnome.nix
    ./_desktop-env/kde-plasma.nix

  ];

  options.desktop.desktop-env = lib.mkOption {
      type = lib.types.enum [
        "gnome"
        "kde-plasma"
      ];
      default = ""; # No desktop by default.
      description = "Desktop environment to install";
  };

}
