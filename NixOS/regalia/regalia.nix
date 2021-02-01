{ config, pkgs, lib, ... }:

{

  services.xserver.windowManager = {
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

# services.xserver.windowManager.xmonad = {
#   enable = true;
#   enableContribAndExtras = true;
#   extraPackages = haskellPackages: [
#     haskellPackages.dbus
#     haskellPackages.xmonad
#     haskellPackages.xmobar
#     haskellPackages.monad-logger
#     haskellPackages.xmonad-contrib
#     haskellPackages.xmonad-extras
#   ];

#   config = ./regalia.hs;
# };


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
