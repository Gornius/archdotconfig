# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile.config import Key, Screen, Group, Drag, Click, Match
from libqtile.lazy import lazy
from libqtile import layout, bar, widget
from libqtile.dgroups import simple_key_binder # For auto binding

from typing import List  # noqa: F401

definedColors = dict(
    background = '#282828',
    foreground = '#ebdbb2',
    color0 =  '#282828',
    color8 =  '#928374',
    color1 =  '#cc241d',
    color9 =  '#fb4934',
    color2 =  '#98971a',
    color10 = '#b8bb26',
    color3 =  '#d79921',
    color11 = '#fabd2f',
    color4 =  '#458588',
    color12 = '#83a598',
    color5 =  '#b16286',
    color13 = '#d3869b',
    color6 =  '#689d6a',
    color14 = '#8ec07c',
    color7 =  '#a89984',
    color15 = '#ebdbb2',
    )

mod = "mod4"

keys = [
    # # Switch between windows in current stack pane
    # Key([mod], "k", lazy.layout.down()),
    # Key([mod], "j", lazy.layout.up()),

    # # Move windows up or down in current stack
    # Key([mod, "control"], "k", lazy.layout.shuffle_down()),
    # Key([mod, "control"], "j", lazy.layout.shuffle_up()),

    # # Switch window focus to other pane(s) of stack
    # Key([mod], "space", lazy.layout.next()),

    # # Swap panes of split stack
    # Key([mod, "shift"], "space", lazy.layout.rotate()),

    # # Suggested for MonadTall

    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod, "shift"], "h", lazy.layout.swap_left()),
    Key([mod, "shift"], "l", lazy.layout.swap_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "o", lazy.layout.maximize()),
    Key([mod, "shift"], "space", lazy.layout.flip()),

    # Toggle floating
    Key([mod], "v", lazy.window.toggle_floating()),
    Key([mod], "b", lazy.window.set_size_floating()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
    Key([mod], "Return", lazy.spawn("kitty")),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "w", lazy.window.kill()),

    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod], "r", lazy.spawncmd()),

    # My bindings
    Key([mod], "d", lazy.spawn("rofi -show drun")),
]

groups = [
        Group("TASK"),
        Group("TERM"),
        Group("WEB", matches=[
            Match(wm_class=["chromium", "Chromium"])
            ]),
        Group("TOOL", matches=[
            Match(wm_class=["Steam", "Steam"])
            ]),
        Group("MISC"),
        Group("MESS", matches=[
            Match(wm_class=["discord", "discord"]),
            Match(wm_class=["caprine", "Caprine"])
            ]),
]

# for i in groups:
#     keys.extend([
#         # mod1 + letter of group = switch to group
#         Key([mod], i.name, lazy.group[i.name].toscreen()),
# 
#         # mod1 + shift + letter of group = switch to & move focused window to group
#         Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True)),
#         # Or, use below if you prefer not to switch to that group.
#         # # mod1 + shift + letter of group = move focused window to group
#         # Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
#     ])

layout_theme = {
        'single_border_width': 0,
        'border_width': 2,
        'margin ':  3,
        'single_margin': 0,
        'border_focus': 'ffffff',
}

layouts = [
    layout.MonadTall(
        **layout_theme,
        ratio=0.6,
        ),
    layout.Floating(**layout_theme),
    # layout.Max(),
    # layout.Stack(num_stacks=2),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Columns(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='Roboto Bold',
    fontsize=14,
    padding=3,
    background=definedColors['background'],
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.GroupBox(
                    highlight_method='line',
                    highlight_color=definedColors['background'],
                    rounded=False,
                    inactive=definedColors['color8'],
                    margin_y=4,
                    padding_y=5,
                    padding_x=8,
                    this_current_screen_border=definedColors['color10'],
                    urgent_border=definedColors['color9'],
                    ),
                widget.Prompt(),
                widget.Spacer(length=5),
                widget.WindowName(),
                widget.Spacer(length=5),
                widget.CPU(
                    format='CPU: {load_percent}%',
                    update_interval=2,
                    ),
                widget.Memory(
                    format='RAM: {MemUsed}M',
                    ),
                widget.PulseVolume(
                    update_interval=0.5,
                    fmt='Volume: {}',
                    ),
                widget.Battery(
                    format = '{char} {percent:2.0%}',
                    battery = 'BAT0',
                    update_interval = 5,
                    unknown_char = 'Plugged',
                    ),
                #widget.TextBox("default config", name="default"),
                widget.Systray(
                    ),
                widget.Spacer(length=5),
                widget.Clock(
                    format='%d-%m %H:%M',
                    ),
                #widget.QuickExit(),
            ],
            24,
        ),
        wallpaper='~/.backgrounds/Aesthetic Scenerys 72.jpg',
        wallpaper_mode='fill',
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod, "shift"], "Button1", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = simple_key_binder(mod)
dgroups_app_rules = [
        ]  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(**layout_theme, float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"


# Improved handling of floating windows
from libqtile import hook
@hook.subscribe.client_new
def floating_size_hints(window):
    hints = window.window.get_wm_normal_hints()
    if hints and hints['max_width']:
        window.floating = True

# Autostart
import os
import subprocess
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/autostart.sh')
    subprocess.call([home])

