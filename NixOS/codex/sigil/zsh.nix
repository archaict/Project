{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;

    enableCompletion      = true;
    enableAutosuggestions = true;
      
    dotDir = ".config/zsh";

    history = {
      size = 10000;
      save = 10000;
      path = ".config/zsh/.zhistory";

      share       = true;
      extended    = true;
      ignoreDups  = true;
      ignoreSpace = true;
    };
  };
}

