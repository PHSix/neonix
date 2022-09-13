{
  description = "My Nix configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/NUR";
    home-manager.url = "github:nix-community/home-manager";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { home-manager, nixpkgs, nur, ... }@inputs:
    let
      neovim-nightly-overlay = final: prev:
        # ((inputs.neovim-nightly-overlay.overlay final) prev);
        ((inputs.neovim-nightly-overlay.overlay final) ({ inherit system; }));
      overlays = [
        inputs.nur.overlay
        neovim-nightly-overlay
        # (final: prev: { final.system = system; })
      ];
      pkgs = import nixpkgs { inherit overlays; };
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        laptop = inputs.nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ({ config, pkgs, ... }: {
              nixpkgs = {
                inherit system;
                inherit overlays;
              };
            })
            ./machines/laptop
            inputs.home-manager.nixosModules.home-manager
          ];
        };
      };
    };
}
