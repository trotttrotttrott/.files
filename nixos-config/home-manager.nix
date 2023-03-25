{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fd
    gh
    git
    go
    gopls
    htop
    jq
    neovim
    shellcheck
    silver-searcher
    tmux
    tree
  ];

  programs.bash = {
    enable = true;
    shellOptions = [];
    historyControl = [ "ignoredups" "ignorespace" ];

    shellAliases = {
      v = "nvim";
      ll = "ls -lah";
    };
  };

  programs.git = {
    enable = true;
    userName = "Chris Trott";
    userEmail = "908409+trotttrotttrott@users.noreply.github.com";
    aliases = {
      b = "branch";
      ci = "commit -v";
      co = "checkout";
      l = "log";
      st = "status";
    };
    extraConfig = {
      core.editor = "nvim";
      core.ignorecase = "false";
      github.user = "trotttrotttrott";
      init.defaultBranch = "main";
    };
  };
}
