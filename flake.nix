{
  description = "NEO NIX configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/NUR";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { home-manager, nixpkgs, nur, ... }: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          { nixpkgs.overlays = [ nur.overlay ]; }
          ./machines/laptop
          home-manager.nixosModules.home-manager
        ];
      };

    };
  };
}
