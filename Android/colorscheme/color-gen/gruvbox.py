# Gruvbox Colorscheme List

from colr import color

colors = {
    "color0"  : "#282828", #back
    "color1"  : "#cc241d", #red
    "color2"  : "#98971a", #green
    "color3"  : "#d79921", #yellow
    "color4"  : "#458588", #blue
    "color5"  : "#b16286", #purple
    "color6"  : "#689d6a", #aqua
    "color7"  : "#a89984", #gray
    "color8"  : "#928374", #gray
    "color9"  : "#fb4934", #red
    "color10" : "#b8bb26", #green
    "color11" : "#fabd2f", #yellow
    "color12" : "#83a598", #blue
    "color13" : "#d3869b", #purple
    "color14" : "#8ec07c", #aqua
    "color15" : "#ebdbb2", #fg

    "back0h"   : "#1d2021", #back0_h
    "bcols0"  : "#282828", #back0
    "bcols1"  : "#3c3836", #back1
    "bcols2"  : "#504945", #back2
    "bcols3"  : "#665c54", #back3
    "bcols4"  : "#7c6f64", #back4
    "gcols0"  : "#928374", #gray
    "ocols0"  : "#d64d0e", #orange
    "ocols1"  : "#fe8019", #orange
}

print("")
print("Color List :")
print("")
print(color("#282828" , fore=colors["color0" ],back=colors["color0" ])," : back  ")
print(color("#cc241d" , fore=colors["color1" ],back=colors["color1" ])," : red   ")
print(color("#98971a" , fore=colors["color2" ],back=colors["color2" ])," : green ")
print(color("#d79921" , fore=colors["color3" ],back=colors["color3" ])," : yellow")
print(color("#458588" , fore=colors["color4" ],back=colors["color4" ])," : blue  ")
print(color("#b16286" , fore=colors["color5" ],back=colors["color5" ])," : purple")
print(color("#689d6a" , fore=colors["color6" ],back=colors["color6" ])," : aqua  ")
print(color("#a89984" , fore=colors["color7" ],back=colors["color7" ])," : gray  ")
print(color("#928374" , fore=colors["color8" ],back=colors["color8" ])," : gray  ")
print(color("#fb4934" , fore=colors["color9" ],back=colors["color9" ])," : red   ")
print(color("#b8bb26" , fore=colors["color10"],back=colors["color10"])," : green ")
print(color("#fabd2f" , fore=colors["color11"],back=colors["color11"])," : yellow")
print(color("#83a598" , fore=colors["color12"],back=colors["color12"])," : blue  ")
print(color("#d3869b" , fore=colors["color13"],back=colors["color13"])," : purple")
print(color("#8ec07c" , fore=colors["color14"],back=colors["color14"])," : aqua  ")
print(color("#ebdbb2" , fore=colors["color15"],back=colors["color15"])," : fg    ")

print(color("#1d2021" , fore=colors["back0h" ],back=colors["back0h" ])," : back0h")
print(color("#282828" , fore=colors["bcols0" ],back=colors["bcols0" ])," : back0 ")
print(color("#3c3836" , fore=colors["bcols1" ],back=colors["bcols1" ])," : back1 ")
print(color("#504945" , fore=colors["bcols2" ],back=colors["bcols2" ])," : back2 ")
print(color("#665c54" , fore=colors["bcols3" ],back=colors["bcols3" ])," : back3 ")
print(color("#7c6f64" , fore=colors["bcols4" ],back=colors["bcols4" ])," : back4 ")
print(color("#928374" , fore=colors["gcols0" ],back=colors["gcols0" ])," : gray  ")
print(color("#d64d0e" , fore=colors["ocols0" ],back=colors["ocols0" ])," : orange")
print(color("#fe8019" , fore=colors["ocols1" ],back=colors["ocols1" ])," : orange")

print("")
