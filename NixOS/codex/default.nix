{ config, pkgs, lib, ... }:

{

# ──── CODEX

  imports = [

# ──── [ CORE ]

    ./arkiv.nix     # ARKIV
    ./extras.nix    # CONFIG
    ./regalia.nix   # REGALIA

# ──── [ REGALIA ]

    ./regalia

# ──── [ SIGIL ]

    ./sigil

  ];

}
