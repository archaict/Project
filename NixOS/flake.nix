{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.09";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { home-manager, nixpkgs, ... }: {
    nixosConfigurations = {
      hostname = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home.manager = {
              useGlobalPkgs = true;
              users.archaict = ./codex.nix;
            };
          }
        ];
      };
    };
  };
}
