{ config, pkgs, lib, ... }:

{
  home.file."Project/NixOS/machina".text =''

#!/run/current-system/sw/bin/bash

#------------------------- greetings -------------------------#
                                                    #function
    greetings() {
    clear
    echo "ARKIV [ NixOS ]"
    echo "Logged in at $(date)" 
    }

    greetings


#------------------------ directories ------------------------#
                                                       #alias

    MACHINA=$PWD
    CORE=$MACHINA/core
    SCHEMA=$MACHINA/schema
    HAIKEI=$SCHEMA/haikei
    NIXCFG=$PWD/configuration.nix
    CFG=$HOME/.config


#-------------------------- aliases --------------------------#
                                                       #alias

    alias eiri="vim $MACHINA/machina"


#-------------------------  prompts  -------------------------#
                                                     #prompts

    precmd() {
      PROMPT='%c %{$fg[blue]%} %{$reset_color%}'
      RPROMPT='%{$fg[blue]%}[ Nix-Core ]%{$reset_color%}'
      }


#--------------------------  codex  --------------------------#
                                                       #alias

    core() {
      if [ -z $1 ]; then
        notify-send "Core navigation launched"
        ranger $CORE
      elif [ $1 = 'edit' ]; then
        notify-send "Machine [ core ] extracted"
        vim $CORE/core.nix
      elif [ $1 = 'pkgs' ]; then
        notify-send "Machine [ core ] extracted"
        vim $CORE/corepkgs.nix
      fi
    }


#--------------------------  codex  --------------------------#
                                                       #alias

    codex() {
      if [ -z $1 ]; then
        notify-send "Codex Manager"
        ranger $MACHINA/codex
      elif [ $1 = 'edit' ]; then
        notify-send "Codex NixOS"
        vim $MACHINA/codex.nix
      fi
    }
    
    sigil() {
      if [ -z $1 ]; then
        notify-send "Sigil NixOS"
        ranger $MACHINA/codex/sigil
      fi
    }

#-------------------------  schemas  -------------------------#
                                                       #alias
    
    genesis() {
      notify-send "Generating code [ $1 ]..."
      echo "Generating genesis..."
      sudo nixos-rebuild \
        -I nixos-config=$NIXCFG \
        -I schema=$SCHEMA/$1.nix switch --fast
      echo "Oratorio incantation [ $1 ]"
      feh --bg-scale $HAIKEI/$1.jpg
      pkill polybar
      polybar -r top &
      kitty @ set-colors --all --configured $CFG/kitty/kitty.conf
      notify-send "Incantation ends."
      echo "Incantation ends."
    }

    chanting() {
      notify-send "Incatation codex [ $1 ]..."
      echo "Chanting codex [ $1 ]..."
      home-manager -f $MACHINA/codex.nix \
        -I schema=$SCHEMA/$1.nix switch
      echo "Oratorio incantation [ $1 ]"
      feh --bg-scale $HAIKEI/$1.jpg
      pkill polybar
      polybar -r top &
      kitty @ set-colors --all --configured $CFG/kitty/kitty.conf
      notify-send "Incantation ends."
      echo "Incantation ends."
    }

#-------------------------------------------------------------#

  '';
}
