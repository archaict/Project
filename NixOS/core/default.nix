{ config, pkgs, lib, ... }:

{

  imports = [
    ./containers.nix
    ./core.nix
    ./corepkgs.nix
    ./network.nix
    ./nixies.nix
    ./overrides.nix
    ./sounds.nix
    ./xserver.nix
    ./damsel-in-distress.nix
    ./hardware-configuration.nix
  ];

}
