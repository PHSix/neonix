{ pkgs, disableList ? [ ], ... }:
let
  defaultPackages = with pkgs; [
    vscode-fhs
    go
    rustup
    python310
    nodejs
    deno
    # gcc
    clang
    cmake
  ];
  packages =
    builtins.filter (package: !(builtins.any (p: p == package)) disableList)
    defaultPackages;
in { home.packages = packages; }
