{
  description = "My Nix configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    home-manager.url = "github:nix-community/home-manager";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    { home-manager, nixpkgs, nur, neovim-nightly-overlay, ... }@inputs: {
      nixosConfigurations = {
        laptop = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            inputs.home-manager.nixosModules.home-manager
            {
              nixpkgs.overlays =
                [ inputs.nur.overlay inputs.neovim-nightly-overlay.overlay ];
            }
            ./machines/laptop
          ];
        };
      };
    };
}
