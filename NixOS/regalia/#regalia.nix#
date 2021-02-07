{ config, pkgs, lib, ... }:

{
  services.xserver = {

  displayManager.defaultSession = "none+xmonad";
  windowManager = {
      exwm = {
        enable = true;
        extraPackages = epkgs: with epkgs; [
          emms
          magit
          proofgeneral
        ];
      };

      xmonad = {
        enable = true;
        enableContribAndExtras = true;
        extraPackages = hp: with hp; [
          dbus
          xmonad
          xmobar
          monad-logger
          xmonad-contrib
          xmonad-extras
        ];
        config = ./regalia.hs;
      };
    };
  };
}



#     i3 = {
#       enable = true;
#       package = pkgs.i3-gaps;
#       extraPackages = with pkgs; [
#         i3-gaps  i3blocks-gaps
#         i3lock   i3lock-fancy
#         i3status
#       ];
#     };

#     qtile = {
#       enable = true;
#     };
