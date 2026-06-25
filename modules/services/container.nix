# Enable containers. Planned to be used as rootless.
{ lib, config, pkgs, ... }: {
  # Set the options.
  options.modules.container = {
    enable = lib.mkEnableOption "Enable podman container.";
    distrobox.enable = lib.mkEnableOption "Enable distrobox";
  };

  config = lib.mkMerge [
    (lib.mkIf (config.modules.container.enable) {
      virtualisation = {
        containers.enable = true;
        containers.registries.search = [ "docker.io" ];
        podman = {
          enable = true;
          dockerCompat = true;
          defaultNetwork.settings.dns_enabled = true;
        };
      };
    })
    (lib.mkIf (config.modules.container.enable && config.modules.container.distrobox.enable) {
      environment.systemPackages = with pkgs; [
        distrobox
      ];
    })
  ];

}
