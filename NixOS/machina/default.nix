{ config, pkgs, lib, ... }:

{
#┌──── IMPORTS ──────────────────────────────────────────── [ hme ] ───┐#
# {{{  Important imports! [imports,schema]

  imports = [
    ./arkiv.nix     # ARKIV
    ./config.nix    # CONFIG
    ./unsignika.nix # UNSIGNIKA

# }}}
#└─────────────────────────────────────────────────────────────────────┘#
#┌──── WINDOW MANAGER ───────────────────────────────────── [ wme ] ───┐#
# {{{  Window Manager for your NixOS 


    ./i3wm.nix      # I3WM
    ./xmonad.nix    # XMONAD
    ./polybar.nix   # POLYBAR
    ./dunst.nix     # DUNST
    ./picom.nix     # PICOM
    ./terminal.nix  # TERMINAL [KITTY]


# }}}
#└─────────────────────────────────────────────────────────────────────┘#
#┌──── PROGRAMS ─────────────────────────────────────────── [ prg ] ───┐#
# {{{ List of programs configured with Nix Home Manager 

    ./direnv.nix    # DIRENV
    ./firefox.nix   # FIREFOX
    ./zathura.nix   # ZATHURA
    ./neovim.nix    # NEOVIM
    ./codium.nix    # CODIUM
    ./zsh.nix       # ZSH
    ./git.nix       # GIT
    ./fzf.nix       # FZF

# }}}
#└─────────────────────────────────────────────────────────────────────┘#
  ];
}
