{
  imports = [ ./schema.nix ];

  vimcolors ={
    color_scheme = "nord" ;
    background = "dark" ;
    light = "255";
    dark = "240";
    cc = "240";
  };

  schema ={
    font = "Iosevka";
  };

  binding ={
    mod = "mod4";
    ws1 = "01" ;
    ws2 = "02" ;
    ws3 = "03" ;
    ws4 = "04" ;
    modifier = "Mod4";
  };

  colors ={
    black        = "#1d2021"; # color0
    red          = "#BF616A"; # color1
    green        = "#A3BE8C"; # color2
    yellow       = "#EBCB8B"; # color3
    blue         = "#81A1C1"; # color4
    magenta      = "#B48EAD"; # color5
    cyan         = "#88C0D0"; # color6
    white        = "#E5E9F0"; # color7
    grey         = "#949494"; # color8

    black_dark   = "#909090"; # color8
    red_dark     = "#BF616A"; # color9
    green_dark   = "#A3BE8C"; # color10
    yellow_dark  = "#EBCB8B"; # color11
    blue_dark    = "#81A1C1"; # color12
    magenta_dark = "#B48EAD"; # color13
    cyan_dark    = "#8FBCBB"; # color14
    white_dark   = "#ECEFF4"; # color15
    grey_dark    = "#303030"; # color8

    orange = "#F99136";

    cursorColor = "#fafafa";
    background  = "#2e2e2e";
    foreground  = "#fafafa";
  };
}
