{ config, pkgs, lib, nur, ... }:

{
  programs.home-manager = {
    enable = true;
  };

  home ={
    username = "archaict";
    homeDirectory = "/home/archaict";
    stateVersion = "20.09";
  # sessionVariables = ./codex/arkiv.nix;
  };

  imports = [

    ./codex
    ./schema/yami.nix

  ];

  manual.json.enable = true;
  news.display = "silent";
  services.emacs.enable = false;

}
