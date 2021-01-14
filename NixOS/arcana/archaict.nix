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
    TERMINAL = "kitty";
    EDITOR = "nvim";
  };

  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

}
