#!/run/current-system/sw/bin/bash

home-manager -I schema=$HOME/Github/Project/NixOS/schema/yami/yami.nix switch
feh --bg-scale ~/Pictures/N_DARK.jpg
pkill polybar
polybar -r top &
kitty @ set-colors --all --configured ~/.config/kitty/kitty.conf
notify-send "Hello Darkness, my old friend."
