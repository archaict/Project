{ config, pkgs, lib, ... }:

{

  imports = [

    ./pkgs           # PKGS

    ./cli.nix        # CLI
    ./codium.nix     # CODIUM
    ./firefox.nix    # FIREFOX
    ./git.nix        # GIT
    ./music.nix      # NCMPCPP
    ./mpv.nix        # MPV
    ./emacs.nix      # EMACS
    ./emacs-init.nix # EMACS
    ./neovim.nix     # NEOVIM
    ./ranger.nix     # RANGER
    ./rofi.nix       # ROFI
  # ./vlc.nix        # VLC
    ./zathura.nix    # ZATHURA
    ./zsh.nix        # ZSH
   
  # ./qutebrowser.nix # QUTE

  ];

}
