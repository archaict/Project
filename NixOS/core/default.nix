{ config, pkgs, lib, ... }:

{

  imports = [
    ./config.nix
    ./containers.nix
    ./core.nix
    ./corepkgs.nix
    ./network.nix
    ./nixies.nix
    ./sounds.nix
    ./xserver.nix
    ./damsel-in-distress.nix
    ./hardware-configuration.nix
  ];

}
