#┌─────────────────────────────────────────────────────────────────────┐#
#│                                                                     │#
#│                          ▘    ▗     ニクソス ▜                      │#
#│                   ▛▌▛▘▛▌ ▌█▌▛▘▜▘  ▀▌▛▌▛▌▛▛▌▀▌▐ ▌▌                   │#
#│                   ▙▌▌ ▙▌ ▌▙▖▙▖▐▖  █▌▌▌▙▌▌▌▌█▌▐▖▙▌                   │#
#│                   ▌     ▙▌                     ▄▌                   │#
#│                                                                     │#
#│             ホームマネージャー      あのまりプロジェクト           │#
#│          NixOS configuration for reproducible linux system          │#
#│                                                                     │#
#│                                                                     │#
#└─────────────────────────────────────────────────────────────────────┘#
#                                                                  nxs  #

{ config, pkgs, ... }:

{
  imports = [
    ./arcana
    ./core
    ./regalia
  ];
  users.users.archaict.isNormalUser = true;
# nixpkgs.overlays = [ nur.overlay ];

# DISABLE
# for useGlobalPkgs, also disable
# ./codex/config.nix in ./codex/default.nix
# home-manager.useGlobalPkgs = true;
# home-manager.useUserPackages = true;
# home-manager = {
#   users.archaict = import ./codex.nix;
# };
}
