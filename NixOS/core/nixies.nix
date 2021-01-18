{ config, pkgs, lib, ... }:

{
  nix = {
    package = pkgs.nixFlakes;
    autoOptimiseStore = true; 
    readOnlyStore = true;
    allowedUsers = ["*"];
    extraOptions = lib.optionalString (
      config.nix.package == pkgs.nixFlakes)
      ''
      keep-outputs = true
      keep-derivations = true
      experimental-features = nix-command flakes
      '';
  };
}
