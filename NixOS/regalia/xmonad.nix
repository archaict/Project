{ config, pkgs, lib, ... }:

{

    services.xserver.windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        extraPackages = hp: [
          hp.dbus
          hp.xmonad
          hp.xmobar
          hp.monad-logger
          hp.xmonad-contrib
          hp.xmonad-extras
        ];
      };

}
