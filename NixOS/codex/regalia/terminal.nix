{ config, pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "${config.schema.font} SemiBold";
      bold_font   = "${config.schema.font} Bold";
      italic_font = "${config.schema.font} Italic";
      bold_italic_font = "${config.schema.font} Bold Italic";

    # cursor_shape      = "underline";
      cursor_shape      = "block";
      open_url_with     = "firefox";

      update_check_interval = 0;
      window_margin_width   = 15;
      scrollback_lines      = 10000;
      enable_audio_bell     = false;
      disable_ligatures     = false;
      clear_all_shortcuts   = true;
      allow_remote_control  = true;

      dynamic_background_opacity = true;

      foreground           = "${config.colors.foreground}";
      background           = "${config.colors.background}";
      selection_foreground = "${config.colors.background}";
      selection_background = "${config.colors.foreground}";
      url_color            = "${config.colors.blue}";
      cursor               = "${config.colors.cursorColor}";
      cursor_text_color    = "${config.colors.background}";

      color0  = "${config.colors.black}";
      color1  = "${config.colors.red}";
      color2  = "${config.colors.green}";
      color3  = "${config.colors.yellow}";
      color4  = "${config.colors.blue}";
      color5  = "${config.colors.magenta}";
      color6  = "${config.colors.cyan}";
      color7  = "${config.colors.white}";
      color8  = "${config.colors.black_dark}";
      color9  = "${config.colors.red_dark}";
      color10 = "${config.colors.green_dark}";
      color11 = "${config.colors.yellow_dark}";
      color12 = "${config.colors.blue_dark}";
      color13 = "${config.colors.magenta_dark}";
      color14 = "${config.colors.cyan_dark}";
      color15 = "${config.colors.white_dark}";
    };

      keybindings = {
          "super+y" = "show_scrollback";
          "ctrl+shift+c" = "copy_to_clipboard";
          "ctrl+shift+v" = "paste_from_clipboard";
          "ctrl+shift+equal" = "change_font_size all +1.0";
          "ctrl+shift+minus" = "change_font_size all -1.0";
          "ctrl+shift+backspace " = "change_font_size all 0";
          "kitty_mod+t" = "new_tab";
      };

      extraConfig = ''
          editor vim
          kitty_mod alt
          font_size 12.0
          background_opacity 0.85
          inactive_text_alpha 0.65
     #{{{ nvim toggle
          scrollback_pager nvim -u NONE -c "set nonumber nolist showtabline=0 foldcolumn=0" -c "autocmd TermOpen * normal gg" -c "map q :qa!<CR>" -c "set clipboard+=unnamedplus" -c "silent write! /tmp/kitty_scrollback_buffer | te cat /tmp/kitty_scrollback_buffer - "
     #}}}
    '';
  };
}
