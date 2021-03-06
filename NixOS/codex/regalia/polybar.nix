{ config, pkgs, lib, ... }:

{
  services.polybar = {
    enable = false;
    script = "polybar -q -r top &";
    package = pkgs.polybar.override {
      i3GapsSupport = true;
      alsaSupport = true;
      pulseSupport = true;
    };
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
      enable-ipc = true;
      fixed-center = true;

      width = "100%";
      height = 22;

      scroll-up = "i3wm-wsnext";
      scroll-down = "i3wm-wsprev";

      background = config.colors.background;
      foreground = config.colors.foreground;

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
        content-background = config.colors.background;
        content-foreground = config.colors.blue;
        padding = 3;
      };

      "module/audio" = {
        type = "internal/pulseaudio";

        format-volume = "<bar-volume>";
        format-volume-padding = 1;
        format-volume-foreground = config.colors.foreground;
        format-volume-background = config.colors.background;
        label-volume = "%percentage%";
        label-volume-foreground = config.colors.foreground;

        format-muted = "<label-muted>";
        label-muted = " MUTED ";
        label-muted-foreground = config.colors.grey;

        bar-volume-width = 3;
        bar-volume-foreground-0 = config.colors.foreground;
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
        format-full-foreground = config.colors.foreground;
        format-full-background = config.colors.background;

        format-charging = "<label-charging>";
        format-charging-padding = 1;
        format-charging-foreground = config.colors.foreground;
        format-charging-background = config.colors.background;
        label-charging = "%{T3}%percentage%%{T-}";

        format-discharging = "<ramp-capacity> <label-discharging>";
        format-discharging-padding = 1;
        format-discharging-foreground = config.colors.foreground;
        format-discharging-background = config.colors.background;
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
        format-foreground = config.colors.foreground;
        format-background = config.colors.background;
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
        format-foreground = config.colors.foreground;

        label = "%time%";
      };

      "module/date" = {
        type = "internal/date";
        interval = "10.0";
        date = "%d";
        format = "<label>";
        format-padding = 0;
        format-foreground = config.colors.foreground;

        label = "%date%";
      };

      "module/i3wm" = {
        type = "internal/i3";
        pin-workspaces = true;
        strip-wsnumbers = true;

        format = "<label-state> <label-mode>";
        format-background = config.colors.background;

        index-sort = false;

        ws-icon-0 = "01;${config.binding.ws1}";
        ws-icon-1 = "02;${config.binding.ws2}";
        ws-icon-2 = "03;${config.binding.ws3}";
        ws-icon-3 = "04;${config.binding.ws4}";

        label-mode = "%mode%";
        label-mode-padding = 1;

        label-unfocused = "%icon%";
        label-unfocused-foreground = config.colors.grey;
        label-unfocused-padding = 1;

        label-focused = "%icon%";
        label-focused-font = 2;
        label-focused-foreground = config.colors.foreground;
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
        content-background = config.colors.background;
        content-foreground = config.colors.yellow;

      };

      "module/xxx" = {
        type = "custom/text";
        content = "%{T3}  %{T-}";
        content-background = config.colors.background;
        content-foreground = config.colors.foreground;
      };

      "module/archive" = {
        type = "custom/text";
        content = "%{T3} Archive Code Number %{T-}";
        content-background = config.colors.background;
        content-foreground = config.colors.foreground;
      };

      "module/network" = {
        type = "internal/network";
        interface = "wlp1s0";

        interval = "1.0";

        accumulate-stats = true;

        format-connected = "<label-connected>";
        format-connected-background = config.colors.background;
        format-connected-underline = config.colors.background;
        format-connected-overline = config.colors.background;
        format-connected-padding = 0;
        format-connected-margin = 0;

        format-disconnected = "<label-disconnected>";
        format-disconnected-background = config.colors.background;
        format-disconnected-underline = config.colors.background;
        format-disconnected-overline = config.colors.background;
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

        icon-0 = "01;${config.binding.ws1}";
        icon-1 = "02;${config.binding.ws2}";
        icon-2 = "03;${config.binding.ws3}";
        icon-3 = "04;${config.binding.ws4}";

        format = "<label-state>";
        label-monitor = "%name%";

        label-active = "%{T5}%name%%{T-}";

        label-active-foreground = "${config.colors.foreground}";
        label-active-background = "${config.colors.background}";
        label-active-padding = 0;

        label-occupied = "";

        label-urgent = "";
        label-urgent-foreground = "${config.colors.foreground}";
        label-urgent-background = "${config.colors.red}";
        label-urgent-padding = 1;

        label-empty = "";
        label-empty-foreground = "${config.colors.foreground}";
        label-empty-padding = 1;

      };
    };
  };

#                                                                  }}}  #

}
