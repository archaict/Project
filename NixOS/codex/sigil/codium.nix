{ config, pkgs, lib, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "update.channel" = "none";
      "[nix]"."editor.tabSize" = 2;
      "vscode-neovim.neovimExecutablePaths.linux" = "/home/archaict/.nix-profile/bin/nvim";
    };
    extensions = with pkgs.vscode-extensions; [
      bbenoist.Nix
      ms-python.python
      justusadam.language-haskell
      vscodevim.vim
    ];
  };
}
