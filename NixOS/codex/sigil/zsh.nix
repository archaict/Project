{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;

    enableCompletion      = true;
    enableAutosuggestions = true;
      
    dotDir = "$HOME/.config/zsh";

    history = {
      size = 10000;
      save = 10000;
      path = "$HOME/.config/zsh/.zhistory";

      share       = true;
      extended    = true;
      ignoreDups  = true;
      ignoreSpace = true;
    };
  };
}

