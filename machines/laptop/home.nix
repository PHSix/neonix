{ pkgs, config, lib, nur, ... }:
let
  username = "ph";
  src = builtins.fetchurl {
    url =
      "https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.19.29/Clash.for.Windows-0.19.29-x64-linux.tar.gz";
    sha256 = "sha256-ICw9ZBGzjF/lPOqTYfTawcTciNGCbNnWR+1jejZR6bQ=";
  };
  cfw = pkgs.nur.repos.linyinfeng.clash-for-windows.override { inherit src; };
in {
  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "mysql" "adbusers" ];
    shell = pkgs.fish;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users."${username}" = { pkgs, config, nur, ... }: {
    home = { stateVersion = "22.11"; };
    imports = [ ./my.nix ];
    home.packages = [
      pkgs.nur.repos.linyinfeng.clash-for-windows
      # cfw
      # repos.xddxdd.dingtalk
    ];
  };
  # lib.mkMerge [
  #   {
  #     home = { stateVersion = "22.11"; };
  #     imports = [ ../../modules/neovim-deps.nix ];
  #   }
  #   ((import ../../modules/kitty.nix { }) {
  #     pkgs = pkgs;
  #     config = config;
  #   })
  # ];
}
