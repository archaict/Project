{ config, pkgs, lib, ... }:

{
    xsession.windowManager = {
        xmonad = {
          enable = true;
          enableContribAndExtras = true;
          config = ../../regalia/regalia.hs;
      };
    };
 }
