{
  description = ''
    Arkiv Configuration Files
  '';

  inputs = {

    nixpkgs.url       = "github:NixOS/nixpkgs/nixos-20.09";
    unstable.url      = "github:NixOS/nixpkgs/nixos-unstable";
    master.url        = "nixpkgs/master";
    nixos.url         = "nixpkgs/release-20.09";
    nur.url           = "github:nix-community/NUR";
    flake-utils.url   = "github:numtide/flake-utils/flatten-tree-system";
    devshell.url      = "github:numtide/devshell";
    ci-agent.url      = "github:hercules-ci/hercules-ci-agent";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
#   nix-doom-emacs.url = "github:vlaci/nix-doom-emacs";
    
    nixos-hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager/release-20.09";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self
  , nixpkgs
  , home-manager
  , master
  , nixos
  , nur
  , flake-utils
  , devshell
# , nix-doom-emacs
  , nixos-hardware
  , ci-agent
  , ... }@inputs:

  let

    overlays = [

      inputs.nur.overlay
      inputs.emacs-overlay.overlay

      (final: prev: {
        unstable = import inputs.nixpkgs-unstable {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      })

    ];

  in {

    nixosConfigurations = {
      nixos = inputs.nixpkgs.lib.nixosSystem {

        system = "x86_64-linux";

        modules = [

          ./configuration.nix
          home-manager.nixosModules.home-manager

          { 
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.archaict = import ./codex.nix;
            };
          }
        #     users.archaict = { pkgs, ... }: {
        #       imports = [
        #         ./codex.nix
        #         nix-doom-emacs.hmModule
        #       ];
        #       programs.doom-emacs = {
        #         enable = true;
        #         doomPrivateDir = ./doom.d;
        #       };
        #     };
        #     
        #   };
        # }

          {
            nix.registry.nixpkgs.flake = inputs.nixpkgs;
            nixpkgs.overlays = overlays;
          }

        ];
        specialArgs = { inherit inputs; };
      };
    };
   
  };
}
