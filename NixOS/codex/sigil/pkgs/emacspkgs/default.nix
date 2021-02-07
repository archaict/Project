{ config, pkgs, lib, ... }:

{

  imports = [

    ./evil.nix
    ./dash.nix
    ./keys.nix
    ./mode.nix
    ./themes.nix
    ./others.nix

  ];

}
