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
      vim-startify
      indentLine
      vim-floaterm

      # colorscheme
      lightline-vim
      lightline-bufferline
      vim-lightline-coc
      dracula-vim
      vim-devicons
      vim-one

      # coc extensions
      coc-nvim
      coc-git
      coc-yank
      coc-flutter
      coc-clap
      coc-pairs
      coc-vimlsp
      coc-pyright

      # frontend development
      coc-tsserver
      coc-json
      coc-css
      coc-emmet
      coc-html
      coc-stylelint
      coc-eslint

      coc-snippets
      coc-explorer
      coc-rust-analyzer
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
