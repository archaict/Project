{ config, pkgs, lib, ... }:

{

  imports = [

    # [ NEOPKGS ]
    ./neopkgs.nix
    # [ EMCPKGS ]
#   ./emacspkgs
#   ./emcpkgs.nix

    # [ ZSHPKGS ]
    ./zsheiri.nix
    ./zshinit.nix
    ./zshpkgs.nix

  ];

}
