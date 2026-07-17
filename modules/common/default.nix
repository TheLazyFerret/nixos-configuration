### 
{ ... }: {
  
  imports = [
    ./disable-hibernation.nix
    ./localization.nix
    ./nix-store.nix
    ./packages.nix
    ./personal-account.nix
    ./podman.nix
  ];

  # Other options that are short enough to not be in its own module.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Visual feedback while typing password in sudo.
  security.sudo.extraConfig = ''
    Defaults pwfeedback 
  '';

  # Enable network manager.
  networking.networkmanager.enable = true;

  # Firmware updates.
  services.fwupd.enable = true;

  # Swapfile configuration.
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 8 * 1024; # 8 GiB
  }];
}