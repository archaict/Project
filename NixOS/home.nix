{ config, pkgs, lib, ... }:

{

  programs.home-manager = {
    enable = true;
  };

  home ={
    username = "archaict";
    homeDirectory = "/home/archaict";
  };

  imports = [ ./machina <schema> ];

  manual.json.enable = true;
  home.stateVersion = "20.09";

}

