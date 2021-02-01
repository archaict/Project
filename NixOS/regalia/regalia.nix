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
    config = ./regalia.hs;
  };


# services.xserver.windowManager.i3 = {
#   enable = true;
#   package = pkgs.i3-gaps;
#   extraPackages = with pkgs; [
#     i3-gaps  i3blocks-gaps
#     i3lock   i3lock-fancy
#     i3status
#   ];
# };

# services.xserver.windowManager.qtile = {
#   enable = true;
# };

}
