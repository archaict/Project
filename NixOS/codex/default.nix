{ config, pkgs, lib, ... }:

{

# ──── CODEX

  imports = [

# ──── [ CORE ]

    ./arkiv.nix     # ARKIV
    ./config.nix    # CONFIG

# ──── [ REGALIA ]

    ./regalia

# ──── [ SIGIL ]

    ./sigil

  ];

}
