{config, lib, pkgs, ...}:

{

  programs.zathura ={
    enable = true;
    options = {
      default-bg = "${config.colors.background_dark}";
      default-fg = "${config.colors.foreground_dark}";
    };
  };

}
