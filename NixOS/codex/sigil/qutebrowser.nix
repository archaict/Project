{ config, pkgs, lib, ... }:

{
  programs.qutebrowser = {
    enable = true;
    searchEngines = {
      DEFAULT = "https://duckduckgo.com?q={}";
      git = "https://github.com/search?q={}";
      pkg = "https://search.nixos.org/packages?channel=20.09&query={}";
      nw = "https://nixos.wiki/index.php?search={}";
      g = "https://www.google.com/search?hl=en&q={}";
      yt = "https://www.youtube.com/results?search_query={}";
    };

    settings = {
      content.host_blocking.enabled = true;
      downloads.location.directory = "~/Downloads";
      scrolling.smooth = false;
      statusbar.show = "never";

      confirm_quit = ["downloads"];

      tabs = {
        position = "bottom";
        background = true;
        show = "multiple";
        title.format = "{current_title}";
        favicons.scale = 0.0;
        indicator = { width = 0; };
      };

      fonts = {
        default_size = "10pt";
        default_family = "Iosevka SemiBold";
        downloads = "Iosevka SemiBold";
        statusbar = "Iosevka SemiBold 10pt";
      };

      hints.border = "0px";

      colors = {
        webpage.prefers_color_scheme_dark = true;

      statusbar = {
        caret = {
          bg = "${config.colors.background}";
          fg = "${config.colors.foreground}";
          selection = {
            bg = "${config.colors.background}";
            fg = "${config.colors.foreground}";
          };
        };
        command = {
          bg = "${config.colors.background}";
          fg = "${config.colors.foreground}";
          private = {
            bg = "${config.colors.background}";
            fg = "${config.colors.foreground}";
          };
        };
        insert = {
          bg = "${config.colors.background}";
          fg = "${config.colors.green}";
        };
        normal = {
          bg = "${config.colors.background}";
          fg = "${config.colors.foreground}";
        };
        passthrough = {
          bg = "${config.colors.background}";
          fg = "${config.colors.foreground}";
        };
        private = {
          bg = "${config.colors.grey}";
          fg = "${config.colors.foreground}";
        };
        progress.bg = "${config.colors.red}";
        url = {
          fg = "${config.colors.foreground}";
          hover.fg = "${config.colors.foreground}";
          success.https.fg = "${config.colors.green}";
          warn.fg = "${config.colors.red}";
        };
      };

      completion = {
        category = {
          bg = "${config.colors.background}";
          border.bottom = "${config.colors.background}";
          border.top = "${config.colors.background}";
          fg = "${config.colors.foreground}";
        };
        even.bg = "${config.colors.background}";
        item = {
          selected = {
            bg = "${config.colors.background}";
            border.bottom = "${config.colors.background}";
            border.top = "${config.colors.background}";
            fg = "${config.colors.green}";
          };
        };
        match.fg = "${config.colors.yellow}";
        odd.bg = "${config.colors.background}";
      };

      downloads = {
        bar.bg = "${config.colors.background}";
        error.bg = "${config.colors.background}";
        error.fg = "${config.colors.red}";
        start.bg = "${config.colors.background}";
        start.fg = "${config.colors.yellow}";
        stop.bg = "${config.colors.background}";
        stop.fg = "${config.colors.foreground}";
        system.bg = "none";
        system.fg = "none";
      };

      hints.bg = "${config.colors.background}";
      hints.fg = "${config.colors.foreground}";
      hints.match.fg = "${config.colors.foreground}";

      tabs = {
        bar.bg = "${config.colors.background}";
        odd.bg = "${config.colors.background}";
        odd.fg = "${config.colors.foreground}";
        even.bg = "${config.colors.background}";
        even.fg = "${config.colors.foreground}";
        indicator.error = "${config.colors.red}";
        selected.even.bg = "${config.colors.background}";
        selected.even.fg = "${config.colors.yellow}";
        selected.odd.bg = "${config.colors.background}";
        selected.odd.fg = "${config.colors.yellow}";
      };
      };

    };
    keyBindings = {
      normal = {
      };
    };
    extraConfig = ''
      pads = { "left":11 ,"right":20 ,"top":23 ,"bottom":24 }
      padding = { "left":5 ,"right":5 ,"top":0 ,"bottom":1 }
      c.tabs.padding = padding
      c.tabs.indicator.padding = padding
      c.statusbar.padding = padding
    '';
  };
}
