{ config, pkgs, lib, ... }:

{

  programs.direnv = {
    enable = true;
    enableNixDirenvIntegration = true;
  };

}
