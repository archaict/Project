{ config, pkgs, lib, ... }:

{

  imports = [

#   ./i3wm.nix      # I3WM
    ./xmonad.nix    # XMONAD
    ./polybar.nix   # POLYBAR
    ./dunst.nix     # DUNST
    ./picom.nix     # PICOM
    ./terminal.nix  # KITTY
    ./gtk.nix       # GTK
    ./etcetera.nix  # ETCETERA

  ];
}
