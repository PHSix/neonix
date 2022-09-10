{ pkgs, ... }:
let extraConfig = builtins.readFile ./vimrc;
in {
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      rainbow
      vim-nix
      vim-clap
      vim-easymotion
      tcomment_vim

      lightline-vim
      vim-lightline-coc

      # coc extensions
      coc-nvim
      coc-json
      coc-git
      coc-yank
      coc-css
      coc-clap
      coc-pairs
      coc-emmet
      coc-vimlsp
      coc-eslint
      coc-pyright
      coc-tsserver
      coc-snippets
      coc-explorer
      coc-stylelint
      coc-rust-analyzer
      dracula-vim
      vim-devicons
    ];
    settings = {
      ignorecase = true;
      background = "dark";
      copyindent = true;
      shiftwidth = 4;
      tabstop = 4;
    };
    inherit extraConfig;
  };
}
