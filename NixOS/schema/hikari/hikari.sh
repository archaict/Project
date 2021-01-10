#!/run/current-system/sw/bin/bash

home-manager -f $HOME/Github/Project/NixOS/home.nix \
  -I schema=$HOME/Github/Project/NixOS/schema/hikari/hikari.nix \
  switch --show-trace
feh --bg-scale ~/Pictures/N_LIGHT.jpg
pkill polybar
polybar -r top &
kitty @ set-colors --all --configured ~/.config/kitty/kitty.conf
notify-send "Let there be LIGHT!"
