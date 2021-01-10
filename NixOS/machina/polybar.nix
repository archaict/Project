{ config, pkgs, lib, ... }:

let

  mod = "Mod4";
  ws1 = "01" ; #"TRM"
  ws2 = "02" ; #"WWW"
  ws3 = "03" ; #"CHT"
  ws4 = "04" ; #"ENT"

  modifier = "Mod4";

in 
{

  services.polybar = {
    enable = true;

    package = pkgs.polybar.override {
      i3GapsSupport = true;
      alsaSupport = true;
      pulseSupport = true;
    };

    script = "polybar -q -r top &";

    config = {
      "global/wm" = {
        margin-bottom = 0;
        margin-top = 0;
      };

#  --  ┌──────────────────────────────────────────────────────────┐ --  #
#  --  │                        ✖ topbar ✖                        │ --  #
#  --  └──────────────────────────────────────────────────────────┘ --  #
#  {{{ Bar positioned on top of the screen

    "bar/top" = {
      bottom = false;
      fixed-center = true;

      width = "100%";
      height = 22;

      scroll-up = "i3wm-wsnext";
      scroll-down = "i3wm-wsprev";

      background = config.colors.background_dark;
      foreground = config.colors.foreground_dark;

      radius = 0;

      font-0 = "Iosevka Nerd Font :style=Bold:size=12;3";
      font-1 = "Iosevka Nerd Font :style=Bold:size=12;3";
      font-2 = "Iosevka Nerd Font :style=Bold:size=9;3";
      font-3 = "Iosevka Nerd Font :style=Bold:size=6;3";
      font-4 = "Iosevka Nerd Font :style=Bold:size=11;3";

      modules-left = "nixos archive ewmh xxx title";
      modules-center = "logo";
      modules-right = "battery network audio time";

      locale = "en_US.UTF-8";
    };


    "settings" = {
      throttle-output = 5;
      throttle-output-for = 10;
      throttle-input-for = 30;

      screenchange-reload = true;

      compositing-background = "source";
      compositing-foreground = "over";
      compositing-overline   = "over";
      comppositing-underline = "over";
      compositing-border     = "over";

      pseudo-transparency = "false";
    };

#                                                                  }}}  #
#  --  ┌──────────────────────────────────────────────────────────┐ --  #
#  --  │                        ✖ module ✖                        │ --  #
#  --  └──────────────────────────────────────────────────────────┘ --  #
#  {{{  Module used for Polybar

      "module/nixos" = {
        type = "custom/text";
        content = "    ";
        content-background = config.colors.background_dark;
        content-foreground = config.colors.blue;
        padding = 3;
      };

      "module/audio" = {
        type = "internal/pulseaudio";

        format-volume = "<bar-volume>";
        format-volume-padding = 1;
        format-volume-foreground = config.colors.foreground_dark;
        format-volume-background = config.colors.background_dark;
        label-volume = "%percentage%";
        label-volume-foreground = config.colors.foreground_dark;

        format-muted = "<label-muted>";
        label-muted = " MUTED ";
        label-muted-foreground = config.colors.grey;

        bar-volume-width = 3;
        bar-volume-foreground-0 = config.colors.foreground_dark;
        bar-volume-empty-foreground = config.colors.grey;
        bar-volume-gradient = false;
        bar-volume-indicator = "%{T3}  %{T-}";
        bar-volume-fill = "%{T3}  %{T-}";
        bar-volume-empty = "%{T3}  %{T-}";

      };

      "module/battery" = {
        type = "internal/battery";
        full-at = 100;
        battery = "BAT0";
        adapter = "AC0";

        poll-interval = 2;

        label-full = "FULL";
        format-full-padding = 1;
        format-full-foreground = config.colors.foreground_dark;
        format-full-background = config.colors.background_dark;

        format-charging = "<label-charging>";
        format-charging-padding = 1;
        format-charging-foreground = config.colors.foreground_dark;
        format-charging-background = config.colors.background_dark;
        label-charging = "%{T3}%percentage%%{T-}";

        format-discharging = "<ramp-capacity> <label-discharging>";
        format-discharging-padding = 1;
        format-discharging-foreground = config.colors.foreground_dark;
        format-discharging-background = config.colors.background_dark;
        label-discharging = "%percentage%%";
        ramp-capacity-0 = "L";
        ramp-capacity-0-foreground = config.colors.red;
        ramp-capacity-1 = "M";
        ramp-capacity-1-foreground = config.colors.red;
        ramp-capacity-2 = "H";
      };

      "module/cpu" = {
        type = "internal/cpu";

        interval = "1.0";

        format = "<label>";
        format-foreground = config.colors.foreground_dark;
        format-background = config.colors.background_dark;
        format-padding = 1;

        label = "%percentage%% C";
      };

      "module/time" = {
        type = "internal/date";
        interval = "10.0";
        time = "%H:%M  ";
        date = "%Y-%m-%d";
        format = "<label>";
        format-padding = 0;
        format-foreground = config.colors.foreground_dark;

        label = "%time%";
      };

      "module/date" = {
        type = "internal/date";
        interval = "10.0";
        date = "%d";
        format = "<label>";
        format-padding = 0;
        format-foreground = config.colors.foreground_dark;

        label = "%date%";
      };

      "module/i3wm" = {
        type = "internal/i3";
        pin-workspaces = true;
        strip-wsnumbers = true;

        format = "<label-state> <label-mode>";
        format-background = config.colors.background_dark;

        index-sort = false;

        ws-icon-0 = "01;${ws1}";
        ws-icon-1 = "02;${ws2}";
        ws-icon-2 = "03;${ws3}";
        ws-icon-3 = "04;${ws4}";

        label-mode = "%mode%";
        label-mode-padding = 1;

        label-unfocused = "%icon%";
        label-unfocused-foreground = config.colors.grey;
        label-unfocused-padding = 1;

        label-focused = "%icon%";
        label-focused-font = 2;
        label-focused-foreground = config.colors.foreground_dark;
        label-focused-padding = 1;

        label-visible = "%icon%";
        label-visible-padding = 1;

        label-urgent = "%icon%";
        label-urgent-foreground = config.colors.red;
        label-urgent-padding = 1;

#       label-separator = "x" ;
      };

      "module/title" = {
        type = "internal/xwindow";
        format = "<label>";
        label = "%{T3}%title%%{T-}";
        label-maxlen = 30;
        label-padding = 1;
      };

      "module/logo" = {
        type = "custom/text";
        content = "%{T3} λ %{T-}";
        content-background = config.colors.background_dark;
        content-foreground = config.colors.yellow;

      };

      "module/xxx" = {
        type = "custom/text";
        content = "%{T3}  %{T-}";
        content-background = config.colors.background_dark;
        content-foreground = config.colors.foreground_dark;
      };

      "module/archive" = {
        type = "custom/text";
        content = "%{T3} Archive Code Number %{T-}";
        content-background = config.colors.background_dark;
        content-foreground = config.colors.foreground_dark;
      };

      "module/network" = {
        type = "internal/network";
        interface = "wlp1s0";

        interval = "1.0";

        accumulate-stats = true;

        format-connected = "<label-connected>";
        format-connected-background = config.colors.background_dark;
        format-connected-underline = config.colors.background_dark;
        format-connected-overline = config.colors.background_dark;
        format-connected-padding = 0;
        format-connected-margin = 0;

        format-disconnected = "<label-disconnected>";
        format-disconnected-background = config.colors.background_dark;
        format-disconnected-underline = config.colors.background_dark;
        format-disconnected-overline = config.colors.background_dark;
        format-disconnected-padding = 0;
        format-disconnected-margin = 0;

        label-connected = "%{T3}%essid%%{T-}";
        label-disconnected = "NULL";
      };

      "module/ewmh" = {
        type = "internal/xworkspaces";

        pin-workspaces = false;
        enable-click   = true;
        enable-scroll  = true;
        reverse-scroll = true;

        icon-0 = "01;${ws1}";
        icon-1 = "02;${ws2}";
        icon-2 = "03;${ws3}";
        icon-3 = "04;${ws4}";

        format = "<label-state>";
        label-monitor = "%name%";

        label-active = "%{T5}%name%%{T-}";

        label-active-foreground = "${config.colors.foreground_dark}";
        label-active-background = "${config.colors.background_dark}";
        label-active-padding = 0;

        label-occupied = "";

        label-urgent = "";
        label-urgent-foreground = "${config.colors.foreground_dark}";
        label-urgent-background = "${config.colors.red}";
        label-urgent-padding = 1;

        label-empty = "";
        label-empty-foreground = "${config.colors.foreground_dark}";
        label-empty-padding = 1;

      };
    };
  };

#                                                                  }}}  #


}
