{ pkgs, config, ... }: {
  environment.systemPackages = with pkgs; [

    networkmanager

    vim
    neovim
    wget
    curl
    exa
    tmux
    ripgrep
    fzf
    lazygit
    lf
    hyperfine
    tree
    neofetch
    fd
    unzip
    unrar
    xsel
    git

  ];
}
