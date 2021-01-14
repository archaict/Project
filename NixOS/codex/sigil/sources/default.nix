{ config, pkgs, lib, ... }:

{

  imports = [

    # [ NEOPKGS ]
    ./neopkgs.nix

    # [ ZSHPKGS ]
    ./zsheiri.nix
    ./zshinit.nix
    ./zshpkgs.nix

  ];

}
