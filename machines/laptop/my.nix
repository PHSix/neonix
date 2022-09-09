{ pkgs, config, lib, ... }@inputs: {
  imports = [
    (import ../../home/wezterm.nix { })
    (import ../../home/kitty.nix { })
    (import ../../home/alacritty.nix { })
    (import ../../home/git.nix { })
    (import ../../home/xdg.nix inputs)
    (import ../../home/tmux.nix (lib.mkMerge [ inputs { } ]))
    (import ../../home/fish.nix inputs)
    (import ../../home/neovim-deps.nix inputs)
    (import ../../home/development.nix inputs)
    (import ../../home/android.nix inputs)
    (import ../../home/jetbrains.nix inputs)
    (import ../../home/vim.nix inputs)
  ];
}
