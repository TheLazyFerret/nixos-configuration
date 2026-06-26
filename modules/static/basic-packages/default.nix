### Basic packages to install in all systems.
{ pkgs, ... }: {
  # Packages to install in the normal way.
  environment.systemPackages = with pkgs; [
    git
    fastfetch
  ];
  # Enable vim and make it default.
  programs.vim = {
    enable = true;
    defaultEditor = true;
  };
}
