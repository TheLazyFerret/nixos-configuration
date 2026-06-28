### Basic packages that I want in all my hosts.
{ pkgs, ... }: {
  # Normal packages.
  environment.systemPackages = with pkgs; [
    curl
    git
    fastfetch
    htop
  ];

  # Other packages with special options.
  programs.vim = {
    enable = true;
    defaultEditor = true;
  };
}