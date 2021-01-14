{config, lib, pkgs, ...}:

{
  programs.zathura ={
    enable = true;
    options = {
      scroll-page-aware = true;

      default-bg = "${config.colors.background}";
      default-fg = "${config.colors.foreground}";

      index-bg = "${config.colors.background}";
      index-fg = "${config.colors.foreground}";
      index-active-bg = "${config.colors.background}";
      index-active-fg = "${config.colors.foreground}";

      inputbar-bg = "${config.colors.background}";
      inputbar-fg = "${config.colors.foreground}";

      statusbar-bg = "${config.colors.background}";
      statusbar-fg = "${config.colors.foreground}";

      notification-error-bg = "${config.colors.background}";
      notification-error-fg = "${config.colors.red}";

      notification-bg = "${config.colors.background}";
      notification-fg = "${config.colors.foreground}";

      completion-bg = "${config.colors.background}";
      completion-fg = "${config.colors.green}";
      completion-group-bg = "${config.colors.background}";
      completion-group-fg = "${config.colors.green}";
      completion-highlight-bg = "${config.colors.background}";
      completion-highlight-fg = "${config.colors.yellow}";
    };
    extraConfig = ''
      map r reload
      map i recolor
      map J zoom out
      map K zoom in
    '';
  };
}
