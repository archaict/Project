{ config, pkgs, lib, ... }:

{
  services = {
    unclutter = {
      enable   = true;
      timeout  = 1;
    };
  };
}
