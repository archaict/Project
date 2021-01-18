{
  imports = [ ./schema.nix ];

  vimcolors ={
    color_scheme = "dracula" ;
    background = "dark" ;
    light = "240";
    dark = "255";
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
    red          = "#ff5555"; # color1
    green        = "#50fa7b"; # color2
    yellow       = "#f1fa8c"; # color3
    blue         = "#6272a4"; # color4
    magenta      = "#bd93f9"; # color5
    cyan         = "#8be9fd"; # color6
    white        = "#f8f8f2"; # color7
    grey         = "#949494"; # color8

    grey_dark    = "#303030"; # color8
    black_dark   = "#ff5555"; # color8
    red_dark     = "#50fa7b"; # color9
    green_dark   = "#f1fa8c"; # color10
    yellow_dark  = "#6272a4"; # color11
    blue_dark    = "#bd93f9"; # color12
    magenta_dark = "#8be9fd"; # color13
    cyan_dark    = "#f8f8f2"; # color14
    white_dark   = "#949494"; # color15

    orange = "#ffb86c";

    cursorColor = "#fafafa";
    background  = "#282a36";
    foreground  = "#f8f8f2";

  };

}
