{ config, pkgs, lib, ... }:

let

  myemacs = import ./epkgs.nix {pkgs=pkgs;};

in

{

  xsession = {
    enable = true;
    windowManager.command = ''
                           ${myemacs}/bin/emacs --daemon -f exwm-enable
                           exec ${myemacs}/bin/emacsclient -c
    '';
  };


# REAL

  services.xserver = {

    displayManager.defaultSession = "none+qtile";
    windowManager = {

#     exwm = {
#       enable = true;
#       enableDefaultConfig = false;
#     };

#     xmonad = {
#       enable = true;
#       enableContribAndExtras = true;
#       extraPackages = hp: with hp; [
#         dbus
#         xmonad
#         xmobar
#         monad-logger
#         xmonad-contrib
#         xmonad-extras
#       ];
#       config = ./regalia.hs;
#     };

#     i3 = {
#       enable = true;
#       package = pkgs.i3-gaps;
#       extraPackages = with pkgs; [
#         i3-gaps  i3blocks-gaps
#         i3lock   i3lock-fancy
#         i3status
#       ];
#     };

      qtile = {
        enable = true;
      };

    };
  };
}




