{ config, pkgs, lib, ... }:

{

  services.dunst = {
    enable = true;
    settings = {

      global = {
        geometry     = "300x20-20+40";
        transparency = 10;
        frame_width  = 20;
        padding      = 10;

        browser      = "firefox";
        font         = "${config.schema.font} Bold 11";

        frame_color  = config.colors.background_dark;
        background   = config.colors.background_dark;
        foreground   = config.colors.foreground_dark;
      };

      urgency_low = {
        background = config.colors.background_dark;
        foreground = config.colors.foreground_dark;
        timeout = 5;
      };
      urgency_normal = {
        background = config.colors.background_dark;
        foreground = config.colors.foreground_dark;
        timeout = 5;
      };
      urgency_critical = {
        background = config.colors.red;
        foreground = config.colors.background_dark;
        timeout = 5;
      };
    };
  };

}
