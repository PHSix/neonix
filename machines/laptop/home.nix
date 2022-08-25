{ pkgs, config, lib, nur, ... }:
let username = "ph";
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
    home.packages = with pkgs.nur; [ repos.linyinfeng.clash-for-windows ];
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
