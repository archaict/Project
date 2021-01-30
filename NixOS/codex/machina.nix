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
    
        MACHINA=$PWD/
        CORE=$MACHINA/core
        SIGIL=$MACHINA/codex/sigil
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
          elif [ -n $2 ]; then
            notify-send "Machine [ core ] extracted"
            vim $CORE/$2
          fi
        }
    
        cores() {
          if [ -z $1 ]; then
            vim $CORE/$1
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
          elif [ $1 = 'edit' ]; then
            notify-send "Sigil NixOS"
            vim $SIGIL/default.nix
          fi
        }
    
    #-------------------------  schemas  -------------------------#
                                                           #alias
        
        genesis() {
          notify-send "Generating code [ $1 ]..."
          echo "Generating genesis..."
          sudo nixos-rebuild -I nixos-config=$NIXCFG switch --fast
        #   -I nixos-config=$NIXCFG
        #   -I schema=$SCHEMA/$1.nix switch --fast
          echo "Oratorio incantation [ $1 ]"
          feh --bg-scale $HAIKEI/$1.jpg
          polybar -r top &
          kitty @ set-colors --all --configured $CFG/kitty/kitty.conf
          notify-send "Incantation ends."
          echo "Incantation ends."
        }
    
        chanting() {
          notify-send "Incatation codex [ $1 ]..."
          echo "Chanting codex [ $1 ]..."
          home-manager -f $MACHINA/codex.nix \
            -I schema=$SCHEMA/$1.nix switch > /dev/null
          echo "Oratorio incantation [ $1 ]"
          polybar-msg cmd restart > /dev/null
          feh --bg-scale $HAIKEI/$1.jpg
          kitty @ set-colors --all --configured $CFG/kitty/kitty.conf
          notify-send "Incantation ends."
          echo "Incantation ends."
        }
    
    #-------------------------------------------------------------#
    
  '';
}
