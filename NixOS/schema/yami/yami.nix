{
  imports = [ ../schema.nix ];

  vimcolors ={
    color_scheme = "nord" ;
    background = "dark" ;
  };

  schema ={
    font = "Iosevka";
  };

  colors ={
    black        = "#1d2021"; # color0
    black_dark   = "#909090"; # color8
    red          = "#BF616A"; # color1
    red_dark     = "#BF616A"; # color9
    green        = "#A3BE8C"; # color2
    green_dark   = "#A3BE8C"; # color10
    yellow       = "#EBCB8B"; # color3
    yellow_dark  = "#EBCB8B"; # color11
    blue         = "#81A1C1"; # color4
    blue_dark    = "#81A1C1"; # color12
    magenta      = "#B48EAD"; # color5
    magenta_dark = "#B48EAD"; # color13
    cyan         = "#88C0D0"; # color6
    cyan_dark    = "#8FBCBB"; # color14
    white        = "#E5E9F0"; # color7
    white_dark   = "#ECEFF4"; # color15
    grey         = "#949494"; # color8
    grey_dark    = "#303030"; # color8

    orange = "#F99136";

    cursorColor_dark  = "#fafafa";
    background_dark = "#2e2e2e";
    foreground_dark = "#fafafa";
  };
}
