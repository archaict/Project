{
  imports = [ ./schema.nix ];

  vimcolors ={
    color_scheme = "gruvbox" ;
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
    black        = "#073642"; # color0
    red          = "#d30102"; # color1
    green        = "#859900"; # color2
    yellow       = "#b58900"; # color3
    blue         = "#268bd2"; # color4
    magenta      = "#d33682"; # color5
    cyan         = "#2aa198"; # color6
    white        = "#eee8d5"; # color7
    grey         = "#606060"; # color8

    black_dark   = "#606060"; # color8
    red_dark     = "#d30102"; # color9
    green_dark   = "#586e75"; # color10
    yellow_dark  = "#b58900"; # color11
    blue_dark    = "#268bd2"; # color12
    magenta_dark = "#6c71c4"; # color13
    cyan_dark    = "#2aa198"; # color14
    white_dark   = "#eee8d5"; # color15
    grey_dark    = "#606060"; # color8

    orange = "#cb4b16";

    cursorColor = "#eee8d5";
    background  = "#073642";
    foreground  = "#eee8d5";
  };
}
