{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    userName = "Archaict";
    userEmail = "crosley40@gmail.com";
  };
}
