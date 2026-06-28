### Enable podman containers.
{ ... }: {
  virtualisation = {
    containers.enable = true;
    containers.registries.search = [ "docker.io" ];
    podman = {
      enable = true;
      dockerCompat = true;
      #defaultNetwork.settings.dns_enabled = true;
    };
  };

  
}