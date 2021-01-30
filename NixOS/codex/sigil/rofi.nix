{ config, pkgs, lib, ... }:

{
  programs.rofi = {
    enable = true;

    font = "${config.schema.font} 12";
    terminal = "${pkgs.kitty}/bin/kitty";

    width = 600;
    lines = 10;
    borderWidth = 2;
    padding = 20;

    theme = null;
    scrollbar = false;

    colors = {
      window = {
        background = "${config.colors.background}";
        border = "${config.colors.grey}";
        separator = "${config.colors.grey}";
      };
      rows = {
        normal = {
          background = "${config.colors.background}";
          foreground = "${config.colors.foreground}";
          backgroundAlt = "${config.colors.background}";
          highlight = {
            background = "${config.colors.blue}";
            foreground = "${config.colors.background}";
          };
        };
      };
    };

  };
}

