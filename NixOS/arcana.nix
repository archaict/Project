{ config, pkgs, lib, ... }:

{

  users.users.archaict = {
    isNormalUser = true;
    extraGroups = [
      "wheel" "tty" "input"
      "audio" "sound" "video"
      "networkmanager" "docker"
      "vboxusers" "libvirtd"
      "adbusers"];
    };

  users.defaultUserShell = pkgs.zsh;

  environment.sessionVariables = {

    # EDITOR = "nvim";
    EDITOR = "emacsclient";
    TERMINAL = "kitty";

    MACHINA = "$HOME/Project/NixOS";
    CORE    = "$MACHINA/core";
    SIGIL   = "$MACHINA/codex/sigil";
    SCHEMA  = "$MACHINA/schema";
    HAIKEI  = "$SCHEMA/haikei";
    NIXCFG  = "$PWD/configuration.nix";
    CFG     = "$HOME/.config";

    STARSHIP_CONFIG = "$CFG/starship.toml";
  };

  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };


}
