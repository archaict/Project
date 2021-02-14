{ config, pkgs, lib, ... }:

{
  home.sessionVariables = {

# ──── [ ARKIV ]

    TERMINAL = "kitty";
  # EDITOR = "nvim";
    EDITOR = "emacsclient";

# ──── [ DIRECTORY ]

    ARC = "$HOME/Archaict";
    DLO = "$HOME/Downloads";
    CFG = "$HOME/.config";
    LCS=  "$HOME/.local/share";
 
    ZARC = "$CFG/zsh";
 
    UNI = "$HOME/Archaict/University";
    DEV = "$HOME/Archaict/University/Devel";
    TCH = "$HOME/Archaict/Teaching";
    AKV = "$HOME/Archaict/Arkiv";
 
    NIXDIR = "$HOME/Project/NixOS";
  # STARSHIP_CONFIG = "$CFG/starship.toml";

# ──── [ EOL ]

  };
}
