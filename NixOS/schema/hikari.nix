{
  imports = [ ./schema.nix ];

  vimcolors ={
    color_scheme = "iceberg" ;
    background = "light" ;
    light = "255";
    dark = "240";
    cc = "255";
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
    red          = "#A84A53"; # color1
    green        = "#8CA775"; # color2
    yellow       = "#A68646"; # color3
    blue         = "#81A1C1"; # color4
    magenta      = "#B48EAD"; # color5
    cyan         = "#78A5A4"; # color6
    white        = "#ffffff"; # color7
    grey         = "#949494"; # color8

    grey_dark    = "#303030"; # color8
    black_dark   = "#909090"; # color8
    red_dark     = "#BF616A"; # color9
    green_dark   = "#A3BE8C"; # color10
    yellow_dark  = "#EBCB8B"; # color11
    blue_dark    = "#6A8AAA"; # color12
    magenta_dark = "#44103C"; # color13
    cyan_dark    = "#8FBCBB"; # color14
    white_dark   = "#ECEFF4"; # color15

    orange = "#F99136";

    cursorColor = "#2e2e2e";
    background  = "#ffffff";
    foreground  = "#2e2e2e";

  };

}
