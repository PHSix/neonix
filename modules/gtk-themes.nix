{ pkgs, config, ... }: {
  environment.systemPackages = with pkgs; [
    arc-theme
    ayu-theme-gtk
    pop-gtk-theme
    numix-gtk-theme
    catppuccin-gtk
    pop-icon-theme
    tela-icon-theme
    papirus-icon-theme
  ];
}
