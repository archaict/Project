{ config, pkgs, lib, ... }:

let
  hm = https://github.com/rycee/home-manager/archive/release-20.09.tar.gz;
in

{

  imports = [
    ./config.nix
    ./containers.nix
    ./core.nix
    ./corepkgs.nix
  # ./dnscrypt.nix
    ./nixies.nix
    ./services.nix
    ./sounds.nix
    ./xserver.nix
    ./damsel-in-distress.nix
    ./hardware-configuration.nix

    ( import "${ builtins.fetchTarball "${hm}" }/nixos" )

  ];

}
