### Extra misc configurations as top-level module.
### They are so small that is worther having them all in the same module.
{ pkgs, ... }: {
  # Show password feedback in sudo.
  security.sudo.extraConfig = ''
    Defaults pwfeedback
  '';

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable firmware updates through fwupd.
  services.fwupd.enable = true;

  # Enable network manager.
  networking.networkmanager.enable = true;

  # Enable Dynamic linker loader.
  programs.nix-ld = {
    enable = true;
    libraries = [ ];
  };

  # Enable flakes.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
