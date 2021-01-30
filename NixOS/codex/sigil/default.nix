{ config, pkgs, lib, ... }:

{

  imports = [

    ./sources       # PKGS

    ./cli.nix       # CLI
    ./codium.nix    # CODIUM
    ./firefox.nix   # FIREFOX
    ./git.nix       # GIT
    ./music.nix     # NCMPCPP
    ./mpv.nix       # MPV
    ./neovim.nix    # NEOVIM
    ./ranger.nix    # RANGER
    ./rofi.nix      # ROFI
  # ./vlc.nix       # VLC
    ./zathura.nix   # ZATHURA
    ./zsh.nix       # ZSH
   
  # ./qutebrowser.nix # QUTE

  ];

}
