### Packages a want in a desktop environmnent.
{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    zed-editor
    gimp
    starship
  ];

  fonts.packages = with pkgs; [
    inconsolata
    nerd-fonts.inconsolata
  ];

  programs.firefox = {
    enable = true;
    languagePacks = [ "es-ES" "en-US" ];
  };
}