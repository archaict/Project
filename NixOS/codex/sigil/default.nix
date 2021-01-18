{ config, pkgs, lib, ... }:

{

  imports = [

    ./sources       # PKGS

    ./cli.nix       # CLI
    ./codium.nix    # CODIUM
    ./firefox.nix   # FIREFOX
    ./git.nix       # GIT
    ./music.nix     # NCMPCPP
    ./neovim.nix    # NEOVIM
    ./ranger.nix    # RANGER
    ./zathura.nix   # ZATHURA
    ./zsh.nix       # ZSH
   
  # ./starship.nix # QUTE
  # ./qutebrowser.nix # QUTE

  ];

}
