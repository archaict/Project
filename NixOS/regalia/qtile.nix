{ config, pkgs, lib, ... }:

{
  services.xserver.windowManager.qtile = {
    enable = true;
  };
}
