{ config, pkgs, lib, ... }:

{

  imports = [
    ./draculs.nix
    ./hikari.nix
    ./yami.nix
    ./gruvbox.nix
    ./solarized.nix
  ];

}
