# Enable containers. Planned to be used as rootless.
{
  lib,
  config,
  pkgs,
  ...
}:
{
  # Set the options.
  options.modules.container = {
    enable = lib.mkEnableOption "Enable podman container.";
    distrobox.enable = lib.mkEnableOption "Enable distrobox";
  };

  config = lib.mkIf (config.modules.container.enable) (lib.mkMerge [
    {
      virtualisation = {
        containers.enable = true;
        containers.registries.search = [ "docker.io" ];
        podman = {
          enable = true;
          dockerCompat = true;
          defaultNetwork.settings.dns_enabled = true;
        };
      };
    }
    (lib.mkIf (config.modules.container.distrobox.enable) {
      environment.systemPackages = with pkgs; [
        distrobox
      ];
    })
  ]);

}
