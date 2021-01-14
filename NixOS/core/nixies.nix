{ config, pkgs, lib, ... }:

{
  nix = {
    autoOptimiseStore = true; 
    readOnlyStore = true;
    allowedUsers = ["*"];
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
      '';
  };
}
