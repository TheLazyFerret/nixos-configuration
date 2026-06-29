###
{ ... }: {
  imports = [
    ./packages.nix
    ./pipewire.nix
    ./gnome.nix
    ./steam.nix
  ];

  # Other small options.
  programs.nix-ld.enable = true; # Dynamic library loader (Specially useful for zed-editor LSP support).

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true; # Use TLP instead of power-profiles-daemon.
    pd.enable = true; #  This allow desktops like gnome or kde use tlp normally.
  };
}
