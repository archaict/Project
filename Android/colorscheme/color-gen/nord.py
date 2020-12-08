# Gruvbox Colorscheme List

from colr import color

colors = {
    "nord0"  : "#2E3440", #back
    "nord1"  : "#3B4252", #red
    "nord2"  : "#434C5E", #green
    "nord3"  : "#4C566A", #yellow
    "nord4"  : "#D8DEE9", #blue
    "nord5"  : "#E5E9F0", #purple
    "nord6"  : "#ECEFF4", #aqua
    "nord7"  : "#8FBCBB", #gray
    "nord8"  : "#88C0D0", #gray
    "nord9"  : "#81A1C1", #red
    "nord10" : "#5E81AC", #green
    "nord11" : "#BF616A", #yellow
    "nord12" : "#D08770", #blue
    "nord13" : "#EBCB8B", #purple
    "nord14" : "#A3BE8C", #aqua
    "nord15" : "#B48EAD", #fg
}

print("")
print("Color List :")
print("")
print(color("#2E3440" , fore=colors["nord0" ],back=colors["nord0" ])," : nord0" )
print(color("#3B4252" , fore=colors["nord1" ],back=colors["nord1" ])," : nord1" )
print(color("#434C5E" , fore=colors["nord2" ],back=colors["nord2" ])," : nord2" )
print(color("#4C566A" , fore=colors["nord3" ],back=colors["nord3" ])," : nord3" )
print(color("#D8DEE9" , fore=colors["nord4" ],back=colors["nord4" ])," : nord4" )
print(color("#E5E9F0" , fore=colors["nord5" ],back=colors["nord5" ])," : nord5" )
print(color("#ECEFF4" , fore=colors["nord6" ],back=colors["nord6" ])," : nord6" )
print(color("#8FBCBB" , fore=colors["nord7" ],back=colors["nord7" ])," : nord7" )
print(color("#88C0D0" , fore=colors["nord8" ],back=colors["nord8" ])," : nord8" )
print(color("#81A1C1" , fore=colors["nord9" ],back=colors["nord9" ])," : nord9" )
print(color("#5E81AC" , fore=colors["nord10"],back=colors["nord10"])," : nord10")
print(color("#BF616A" , fore=colors["nord11"],back=colors["nord11"])," : nord11")
print(color("#D08770" , fore=colors["nord12"],back=colors["nord12"])," : nord12")
print(color("#EBCB8B" , fore=colors["nord13"],back=colors["nord13"])," : nord13")
print(color("#A3BE8C" , fore=colors["nord14"],back=colors["nord14"])," : nord14")
print(color("#B48EAD" , fore=colors["nord15"],back=colors["nord15"])," : nord15")

print("")


