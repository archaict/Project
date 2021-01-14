{ config, pkgs, lib, ... }:

{

# ──── CODEX

  imports = [

# ──── [ CORE ]

    ./arkiv.nix     # ARKIV
    ./config.nix    # CONFIG
    ./machina.nix   # MACHINA

# ──── [ REGALIA ]

    ./regalia

# ──── [ SIGIL ]

    ./sigil

  ];

}
