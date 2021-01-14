{ config, pkgs, nixpkgs, lib, ... }:

{

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/1926ca53a123df45d47ec04c362657c626415da0.tar.gz") {
      inherit pkgs;
    };
  };

}
