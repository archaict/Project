{ config, pkgs, lib, ... }:

{

  imports = [
    ./config.nix
  # ./containers.nix
    ./core.nix
    ./corepkgs.nix
    ./nixies.nix
    ./services.nix
    ./sounds.nix
    ./xserver.nix
    ./damsel-in-distress.nix
    ./hardware-configuration.nix
  ];

}
