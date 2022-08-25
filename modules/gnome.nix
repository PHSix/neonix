{ pkgs, config, ... }: {
  services = {
    gnome = { gnome-keyring = { enable = true; }; };
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = true;
      desktopManager = { gnome.enable = true; };
      layout = "us";
      xkbOptions = "caps:escape";
      autoRepeatDelay = 300;
      autoRepeatInterval = 30;
    };
  };
  environment.systemPackages = (with pkgs.gnomeExtensions; [
    proxy-switcher
    removable-drive-menu
    appindicator
    gsconnect
    tray-icons-reloaded
    blur-my-shell
    net-speed-simplified
  ]) ++ (with pkgs.gnome; [
    gnome-tweaks
    gnome-boxes
    gnome-screenshot
    gnome-shell-extensions
  ]);
}
