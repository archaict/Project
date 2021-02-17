{ config, pkgs, lib, ... }:

{

  imports = [

    ./pkgs           # PKGS

    ./cli.nix        # CLI
  # ./codium.nix     # CODIUM
    ./emacs.nix      # EMACS
    ./firefox.nix    # FIREFOX
    ./git.nix        # GIT
    ./music.nix      # NCMPCPP
    ./mpv.nix        # MPV
    ./neovim.nix     # NEOVIM
    ./ranger.nix     # RANGER
    ./rofi.nix       # ROFI
  # ./vlc.nix        # VLC
    ./zathura.nix    # ZATHURA
    ./zsh.nix        # ZSH
   
  # ./qutebrowser.nix # QUTE

  ];

}
