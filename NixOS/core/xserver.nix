{ config, pkgs, lib, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "caps:super";
    autoRepeatDelay = 200;
    autoRepeatInterval = 25;
    libinput.enable = true;

    desktopManager.xterm.enable = false;
    displayManager = {
      gdm.enable = true;
      defaultSession = "none+xmonad";
    };
  };

  services.logind = {
    lidSwitch = "ignore";
    extraConfig = ''
      LidSwitchIgnoreInhibited = False
      IdleAction=ignore
      '';
    };
}
