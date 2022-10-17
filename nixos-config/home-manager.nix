{ pkgs, ... }:

{
  home.packages = with pkgs; [
    go
    gopls
    htop
    jq
    neovim
    tmux
    tree
  ];
}
