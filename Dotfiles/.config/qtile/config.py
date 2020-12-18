#----------------------- QTILE CONFIGS -----------------------#

import os
import subprocess

from libqtile import qtile,hook
from typing import List
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

#------------------------- VARIABLES -------------------------#

ALT   = "mod1"
MOD   = "mod4"
TAB   = "Tab"
TERM  = "termite"
SHIFT = "shift"

#------------------------ KEYBINDINGS ------------------------#

keys = [

    #------------------- navigation --------------------#
    Key([MOD]       , "h", lazy.layout.left()),
    Key([MOD]       , "j", lazy.layout.down()),
    Key([MOD]       , "k", lazy.layout.up()),
    Key([MOD]       , "l", lazy.layout.right()),

    Key([ALT]       , "j", lazy.layout.grow_down()),
    Key([ALT]       , "k", lazy.layout.grow_up()),
    Key([ALT]       , "h", lazy.layout.grow_left()),
    Key([ALT]       , "l", lazy.layout.grow_right()),

    Key([MOD,SHIFT] , "h", lazy.layout.shuffle_left()),
    Key([MOD,SHIFT] , "j", lazy.layout.shuffle_down()),
    Key([MOD,SHIFT] , "k", lazy.layout.shuffle_up()),
    Key([MOD,SHIFT] , "l", lazy.layout.shuffle_right()),

    #-------------------- workspaces --------------------#

    Key([MOD]       , "a", lazy.group["  "].toscreen()),
    Key([MOD]       , "s", lazy.group["  "].toscreen()),
    Key([MOD]       , "d", lazy.group["  "].toscreen()),

    Key([MOD]       , "f", lazy.next_layout()),

    Key([MOD]       , "semicolon",
        lazy.hide_show_bar("top")),

    #------------------- applications -------------------#

    Key([MOD] , "Return",
        lazy.spawn(TERM)),
    Key([MOD] , "i",
        lazy.spawn("firefox")),
    Key([MOD] , "n",
        lazy.spawn("chromium --kiosk web.whatsapp.com")),
    Key([MOD] , "m",
        lazy.spawn("termite -e ncmpcpp")),
    Key([MOD] , "space",
        lazy.spawn("dmenu_run -nb '#1a1a1a' \
                   -nf '#fafafa' -sf '#fafafa' \
                   -sb '#404040' -h 23 -w 826 -x 270")),

    #-------------------- operations --------------------#

    Key([MOD]       , "w", lazy.window.kill()),
    Key([MOD]       , "c", lazy.restart()),
    Key([MOD,SHIFT] , "x", lazy.shutdown(),),

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
]

#------------------------- WORKSPACE -------------------------#

def init_group_names():
    return [("  " , {"layout":"monadtall"}),
            ("  " , {"layout":"monadtall"}),
            ("  " , {"layout":"monadtall"})]

def init_groups():
    return[Group(name, **kwargs) for name, kwargs in group_names]

if __name__ in["config","__main__"]:
    group_names = init_group_names()
    groups = init_groups()

for i, (name, kwargs) in enumerate(group_names,1):
    keys.append(Key([MOD], str(i), lazy.group[name].toscreen()))
    keys.append(Key([MOD, "shift"], str(i), lazy.window.togroup(name)))


#-------------------------- LAYOUTS --------------------------#

layouts = [
    layout.Max(
    ),
    layout.MonadTall(
        border_focus = "#d75f5f",
        margin = 8
    ),
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()


#-------------------------- TOPBAR --------------------------#
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(),
                widget.WindowName(
                    foreground="#1a1a1a"),
                widget.TextBox(
                    "ANOMALY // ",
                    foreground="#d75f5f"),
                widget.Systray(),
                widget.Clock(
                    format='%a // %Y-%m-%d // %I:%M %p'),
            ],24,
              background="#1a1a1a",
        ),
    ),
]

#-------------------------- MOUSES --------------------------#

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

#-------------------------- SCRIPTS --------------------------#

main = None
wmname = "LG3D"
cursor_warp = False
auto_fullscreen = False
dgroups_app_rules = []
dgroups_key_binder = None
follow_mouse_focus = True
bring_front_click = False
focus_on_window_activation = "smart"

floating_layout = layout.Floating(float_rules=[
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
