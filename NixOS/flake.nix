{
  description = "An example NixOS configuration";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-20.09"; };
    nur = { url = "github:nix-community/NUR"; };
  };

  outputs = inputs:
    let ignoreme = ({config,lib,...}: with lib; { system.nixos.revision = mkForce null; system.nixos.versionSuffix = mkForce "pre-git"; }); in
  {
    nixosConfigurations = {

      mysystem = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (import ./configuration.nix)

        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}


