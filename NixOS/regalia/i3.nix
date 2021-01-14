{ config, pkgs, lib, ... }:

{

    services.xserver.windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [
          i3-gaps  i3blocks-gaps
          i3lock   i3lock-fancy
          i3status
        ];
    };

}
