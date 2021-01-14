{
  imports = [ ./schema.nix ];

  vimcolors ={
    color_scheme = "gruvbox" ;
    background = "dark" ;
    light = "240";
    dark = "255";
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
    red          = "#fb6934"; # color1
    green        = "#b8bb26"; # color2
    yellow       = "#fabd2f"; # color3
    blue         = "#83a598"; # color4
    magenta      = "#d3869b"; # color5
    cyan         = "#8ec07c"; # color6
    white        = "#fbf1c7"; # color7
    grey         = "#707070"; # color8

    black_dark   = "#282828"; # color8
    red_dark     = "#cc241d"; # color9
    green_dark   = "#98971a"; # color10
    yellow_dark  = "#d79921"; # color11
    blue_dark    = "#458588"; # color12
    magenta_dark = "#b16286"; # color13
    cyan_dark    = "#689d6a"; # color14
    white_dark   = "#ebdbb2"; # color15
    grey_dark    = "#303030"; # color8

    orange = "#Fe8019";

    cursorColor = "#fbf1c7";
    background  = "#1d2021";
    foreground  = "#fbf1c7";
  };
}
