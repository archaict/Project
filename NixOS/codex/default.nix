{ config, pkgs, lib, ... }:

{

# ──── CODEX

  imports = [

# ──── [ CORE ]

    ./arkiv.nix     # ARKIV
    ./extras.nix    # CONFIG

# ──── [ REGALIA ]

    ./regalia

# ──── [ SIGIL ]

    ./sigil

  ];

}
