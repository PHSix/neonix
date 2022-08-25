{ pkgs, config, ... }: {
  imports = [
    ./sys.nix
    ./home.nix
    ../../modules/gnome.nix
    ../../modules/gtk-themes.nix
    ../../modules/locale.nix
    ../../modules/cli-tool.nix
    ../../modules/broswer.nix
    ./hardware-configuration.nix
  ];
}
