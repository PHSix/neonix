# neovim dependences for nixos (contain some lsp, formatter and so on.)
#	
{ pkgs, ... }: {
  home.packages =
    # formatter
    (with pkgs; [
      nixfmt
      stylua
      # rustfmt
    ]) ++ (with pkgs.nodePackages; [
      lua-fmt
      prettier

      eslint
    ]) ++
    # lsp
    (with pkgs; [
      sqls
      gopls
      rnix-lsp
      rust-analyzer
      sumneko-lua-language-server
    ]) ++ (with pkgs.nodePackages; [
      typescript
      pyright
      bash-language-server
      typescript-language-server
      vscode-css-languageserver-bin
      vscode-json-languageserver

    ]) ++ (with pkgs;
      [

      ]);
}
