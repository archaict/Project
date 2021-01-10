#!/run/current-system/sw/bin/bash

home-manager -I schema=$HOME/.config/nixpkgs/schema/hikari/hikari.nix \
  switch --show-trace
feh --bg-scale ~/Pictures/N_LIGHT.jpg
pkill polybar
polybar -r top &
kitty @ set-colors --all --configured ~/.config/kitty/kitty.conf
notify-send "Let there be LIGHT!"
