{ config, pkgs, lib, ... }:

{
  programs.home-manager = {
    enable = true;
  };

  home ={
    username = "archaict";
    homeDirectory = "/home/archaict";
    stateVersion = "20.09";
  };

  imports = [ ./codex <schema> ];

  manual.json.enable = true;
  news.display = "silent";
}
