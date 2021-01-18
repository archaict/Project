{ config, pkgs, lib, ... }:

let

  unstableTarball = fetchTarball
  https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz;

  unstable = import (builtins.unstableTarball)
  { config = config.nixpkgs.config; };

in

{

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (
      builtins.fetchTarball {
        url = "https://github.com/nix-community/NUR/archive/1926ca53a123df45d47ec04c362657c626415da0.tar.gz";
        sha256 = "0zlbj9q099mczbh9c6ny7sqr087g3b3a6ds0q6m544g0w740wwqz";
      }
    )
        { inherit pkgs; };

      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };

}
