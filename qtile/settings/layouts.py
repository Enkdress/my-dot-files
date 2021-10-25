# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

from libqtile import layout
from libqtile.config import Match
from .theme import colors

# Layouts and layout rules


layout_conf = {
    'border_focus': colors['focus'][0],
    'border_width': 2,
    'margin': 10
}

treeTab_conf = {
    'bg_color': colors['grey'][0],
    'active_bg': colors['color1'][0],
    'panel_width': 220,
    'sections': ['Main Section'],
    'section_fontsize': 18,
    'section_left': 48,
    'font': 'Fira Code',
}

layouts = [
    layout.MonadTall(**layout_conf),
    layout.MonadWide(**layout_conf),
    layout.Max(),
    layout.Bsp(**layout_conf),
    layout.Matrix(columns=2, **layout_conf),
    layout.RatioTile(**layout_conf),
    layout.TreeTab(**treeTab_conf),
    # layout.Slice(),
    # layout.Stack(),
    # layout.Tile(),
    # layout.Columns(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),
        Match(wm_class='makebranch'),
        Match(wm_class='maketag'),
        Match(wm_class='ssh-askpass'),
        Match(title='branchdialog'),
        Match(title='pinentry'),
        Match(wm_class='floating'),
    ],
    border_focus=colors["color4"][0]
)
