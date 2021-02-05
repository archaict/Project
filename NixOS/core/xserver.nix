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
      lightdm = {
        enable = true;
        greeters.mini = {
          enable = true;
          user = "archaict";
          extraConfig = ''
            [greeter]
            show-input-cursor = false
            show-password-label = true
            password-label-text = ❯
            password-alignment = right
            password-input-width = 30

            [greeter-theme]
            layout-space = 12
            border-width = 0px
            background-image = ""
            password-border-width = 0px
            border-color = "#2e2e2e"
            text-color = "#fafafa"
            window-color = "#2e2e2e"
            background-color = "#1d2021"
            password-color = "#fafafa"
            password-background-color = "#404040"
            '';
        };
    # defaultSession = "none+xmonad";
      };
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
