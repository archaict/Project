import os
import subprocess

from libqtile import qtile,hook
from typing import List
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Screen
from libqtile.config import KeyChord, Key
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

#--- modifiers ---#

ALT    = "mod1"
MOD    = "mod4"
TAB    = "Tab"
TERM   = "kitty"
FILES  = "pcmanfm"
SHIFT  = "shift"
HELLO = print("hello")

#----- color -----#

BLACK  = "#272422"
RED    = "#d75f5f"
GREEN  = "#b8bb26"
YELLOW = "#fabd2f"
BLUE   = "#64AECC"
PURPLE = "#d3869b"
WHITE  = "#e5e6e7"
GREY   = "#C0ACA7"

ORI_BLACK  = "#1a1a1a"
ORI_RED    = "#d75f5f"
ORI_GREEN  = "#b8bb26"
ORI_YELLOW = "#fabd2f"
ORI_BLUE   = "#83a598"
ORI_PURPLE = "#d3869b"
ORI_WHITE  = "#dddddd"
ORI_GREY   = "#aaaaaa"

widget_defaults = dict(
    font="Ubuntu Bold",
    fontsize = 12,
    background = BLACK
)

keys = [

    #------------------- navigation --------------------#

    Key([MOD]       , "h", lazy.layout.left()),
    Key([MOD]       , "j", lazy.layout.down()),
    Key([MOD]       , "k", lazy.layout.up()),
    Key([MOD]       , "l", lazy.layout.right()),

    Key([MOD,ALT], "l", lazy.layout.grow()),
    Key([MOD,ALT], "h", lazy.layout.shrink()),

    Key([MOD,SHIFT] , "h", lazy.layout.shuffle_left()),
    Key([MOD,SHIFT] , "j", lazy.layout.shuffle_down()),
    Key([MOD,SHIFT] , "k", lazy.layout.shuffle_up()),
    Key([MOD,SHIFT] , "l", lazy.layout.shuffle_right()),
    Key([MOD]       , "q", lazy.layout.flip()),
    #-------------------- workspaces --------------------#

    Key([MOD]       , "a", lazy.group["1"].toscreen()),
    Key([MOD]       , "s", lazy.group["2"].toscreen()),
    Key([MOD]       , "d", lazy.group["3"].toscreen()),
    Key([MOD]       , "p", lazy.group["4"].toscreen()),


    Key([MOD]       , "f", lazy.next_layout()),

    Key([MOD]       , "semicolon",
        lazy.hide_show_bar("top")),

    #------------------- applications -------------------#

    Key([MOD] , "slash",
        lazy.spawn(FILES)),
    Key([MOD] , "i",
        lazy.spawn("firefox")),
    Key([MOD] , "space",
        lazy.spawn("dmenu_run -nb '#272422' \
                   -nf '#fafafa' -sf '#fafafa' \
                   -fn 'PragmataPro-10'\
                   -sb '#404040' -h 20 -w 480 -x 445 -y 2")),
    Key([MOD, SHIFT] , "space",
        lazy.spawn("i3lock -n -i /home/arandel/Pictures/genshin.jpg --insidecolor=373445ff --ringcolor=ffffffff --line-uses-inside --keyhlcolor=d23c3dff --bshlcolor=d23c3dff --separatorcolor=00000000 --insidevercolor=feffffff --insidewrongcolor=d23c3dff --ringvercolor=ffffffff --ringwrongcolor=ffffffff --radius=15 --veriftext="" --wrongtext="" --clock --timepos='x+150:y+734' --datepos='x+150:y+728' --timecolor='ffffffff' --datecolor='00000000' --indpos='x+50:y+723' --indicator")),

    #-------------------- operations --------------------#

    Key([MOD]       , "w", lazy.window.kill()),
    Key([MOD]       , "c", lazy.restart()),
    Key([MOD,SHIFT] , "x", lazy.shutdown(),),

    #---------------------- chrome ----------------------#

    KeyChord([MOD], "e", [

        Key([], "c",
            lazy.spawn("chromium --kiosk https://classroom.google.com/")),

        Key([], "w",
            lazy.spawn("chromium --kiosk web.whatsapp.com")),

        Key([], "m",
            lazy.spawn("chromium --kiosk https://meet.google.com/")),

        ]),


    #---------------------- sounds ----------------------#

    Key(
        [], "XF86AudioMute",
        lazy.spawn("pactl set-sink-mute 0 toggle")
    ),
    Key(
        [], "XF86AudioRaiseVolume",
        lazy.spawn("pactl -- set-sink-volume 0 +5%")
    ),
    Key(
        [], "XF86AudioLowerVolume",
        lazy.spawn("pactl -- set-sink-volume 0 -5%")
    ),

    #---------------------- musics ----------------------#

    Key(
        [MOD], "XF86AudioMute",
        lazy.spawn("mpc toggle")
    ),
    Key(
        [MOD], "XF86AudioRaiseVolume",
        lazy.spawn("mpc next")
    ),
    Key(
        [MOD], "XF86AudioLowerVolume",
        lazy.spawn("mpc prev")
    ),

    #-------------------- backlights --------------------#

    Key(
        [], "XF86MonBrightnessUp",
        lazy.spawn("xbacklight +1")
    ),
    Key(
        [], "XF86MonBrightnessDown",
        lazy.spawn("xbacklight -1")
    ),

    #--------------------  terminal  --------------------#

    Key([MOD] , "Return",
        lazy.spawn(TERM)),

    KeyChord([MOD], "r", [

        Key([], "w",
            lazy.spawn("termite -e '/home/arandel/scripts/wal.sh'")),

        Key([], "s",
            lazy.spawn("termite -e '/home/arandel/scripts/screenshot.sh'")),

        Key([], "v",
        lazy.spawn("termite -e vim")),

        ]),

    Key([MOD] , "m",
        lazy.spawn("termite -e ncmpcpp")),
]

groups = []

group_names = ["1", "2", "3","4",]
group_labels = ["ᚨᚾ", "ᛟᛗ", "ᚨᛚᚤ","ᛗᚢᛋᛖ"]
group_layouts = ["monadtall", "monadtall", "monadtall","monadtall"]

group_exclusives = [
    False, False, False,
    False,
]

group_persists = [
    True, True, True,
    True,
]

group_inits = [
    True, True, True,
    True,
]


for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            exclusive=group_exclusives[i],
            layout=group_layouts[i].lower(),
            persist=group_persists[i],
            init=group_inits[i],
            label=group_labels[i],
        ))

for i in groups:
    keys.extend([
        Key([MOD], i.name, lazy.group[i.name].toscreen()),
        Key([MOD, "shift"], i.name, lazy.window.togroup(i.name)),
    ])

layouts = [
    layout.Max(
    ),
    layout.MonadTall(
        border_focus = YELLOW,
        margin = 14
    ),
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [

       #-------------------- left --------------------#     

                widget.TextBox(" "),
                widget.GroupBox(
                    font = "PragmataPro Bold",
                    fontsize = 12,
                    padding_x = 5,
                    margin_x = 0,
                    active = WHITE,
                    inactive = GREY,
                    borderwidth = 3,
                    highlight_method = "line",
                    disable_drag = True,
                    this_current_screen_border = YELLOW,
                    highlight_color = [BLACK],
                ),
                widget.TextBox("  ᛝ  ",
                    font = "PragmataPro Bold",
                               ),
                widget.CPU(
                    format = '{load_percent}',
                    font = "PragmataPro Bold",
                    fontsize = 11,
                ),
                widget.TextBox(""),
                widget.Memory(
                    format = '{MemFree}',
                    foreground = YELLOW,
                    font = "PragmataPro Bold",
                    fontsize = 11,
                ),
                widget.TextBox(""),
                widget.ThermalSensor(
                    foreground = BLUE,
                    foreground_alert = RED,
                    font = "PragmataPro Bold",
                    fontsize = 11,
                ),
                widget.TextBox("  ᛝ  ",
                    font = "PragmataPro Bold",
                               ),
                widget.TextBox(
                    "ᚨᚱᚨᚾᛞᛖᛚ ᚨᛏ ᛚᛟᚲᚨᛚᚺᛟᛋᛏ",
                    font = "PragmataPro Bold",
                    fontsize = 11,
                               ),
                widget.TextBox(" ",
                               ),
                widget.Systray(),

       #-------------------- mids --------------------#     

                widget.Spacer(),
                widget.TextBox(
                    " ANOMALY ",
                    font = "Signika Bold"
                ),
                widget.Spacer(),

       #-------------------- rght --------------------#     

                widget.Wlan(
                    interface = "wlp1s0",
                    disconnected_message = "null",
                    format = "{essid} ",
                    font = "PragmataPro Bold Italic",
                    fontsize = 11,
                    padding = 0,
                    foreground = WHITE
                ),
                widget.TextBox(""),
                widget.Battery(
                    foreground=GREEN,
                    font = "PragmataPro Bold Italic",
                    fontsize = 11,
                    format = 'ᛈᚹᚱ {percent:2.0%}',
                    notify_below = 0.2,
                    low_percentage = 0.2,
                    low_foreground = RED
                ),
                widget.TextBox("  ᛝ  ",
                    font = "PragmataPro Bold",
                               ),
                widget.Mpd2(
                    no_connection = " ",
                    keys = {'toggle': 1},
                    font = "PragmataPro Bold Italic",
                    fontsize = 11,
                    idle_format = '',
                    status_format = '{title}',
                ),
                widget.TextBox(""),
                widget.PulseVolume(
                    font = "PragmataPro Bold Italic",
                    fontsize = 11,
                ),
                widget.TextBox("  ᛝ  ",
                    font = "PragmataPro Bold",
                               ),
                widget.Clock(
                    foreground = WHITE,
                    font = "PragmataPro Bold",
                    format='%I:%M %p'),
                widget.TextBox(" "),

            ],24,
              background=BLACK,
        ),
    ),
]

mouse = [
    Drag([MOD], "Button1",
         lazy.window.set_position_floating(),
         start=lazy.window.get_position()),

    Drag([MOD], "Button3",
         lazy.window.set_size_floating(),
         start=lazy.window.get_size()),

    Click([MOD], "Button2",
         lazy.window.bring_to_front())
]

main = None
wmname = "LG3D"
cursor_warp = False
auto_fullscreen = False
dgroups_app_rules = []
dgroups_key_binder = None
follow_mouse_focus = True
bring_front_click = False
focus_on_window_activation = "smart"

floating_layout = layout.Floating(
    border_focus = YELLOW,

    float_rules=[
    {'wmclass' : 'confirm'},
    {'wmclass' : 'dialog'},
    {'wmclass' : 'download'},
    {'wmclass' : 'error'},
    {'wmclass' : 'file_progress'},
    {'wmclass' : 'notification'},
    {'wmclass' : 'splash'},
    {'wmclass' : 'toolbar'},
    {'wmclass' : 'confirmreset'},  # gitk
    {'wmclass' : 'makebranch'},  # gitk
    {'wmclass' : 'maketag'},  # gitk
    {'wname'   : 'branchdialog'},  # gitk
    {'wname'   : 'pinentry'},  # GPG key password entry
    {'wmclass' : 'ssh-askpass'},  # ssh-askpass
])

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

