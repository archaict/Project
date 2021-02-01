{
  description = "Arkiv";

  inputs = {

    nixpkgs.url        = "github:NixOS/nixpkgs/nixos-20.09";
    unstable.url       = "github:NixOS/nixpkgs/nixos-unstable";
    home.url           = "github:nix-community/home-manager/release-20.09";
    master.url         = "nixpkgs/master";
    nixos.url          = "nixpkgs/release-20.09";
    nur.url            = "github:nix-community/NUR";
    flake-utils.url    = "github:numtide/flake-utils/flatten-tree-system";
    devshell.url       = "github:numtide/devshell";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    ci-agent.url       = "github:hercules-ci/hercules-ci-agent";

  };

  outputs = { self
  , nixpkgs
  , home
  , master
  , nixos
  , flake-utils
  , devshell
  , nixos-hardware
  , ci-agent
  , ... }:
  let
    pkgs = nixpkgs;
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix];
    };
  };
}
