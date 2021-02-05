{ config, pkgs, lib, ... }:

{

  imports = [

    # [ NEOPKGS ]
    ./neopkgs.nix
    # [ EMCPKGS ]
    ./emcpkgs.nix

    # [ ZSHPKGS ]
    ./zsheiri.nix
    ./zshinit.nix
    ./zshpkgs.nix

  ];

}
