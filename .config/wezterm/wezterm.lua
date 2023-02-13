local wezterm = require 'wezterm'

return {
    font = wezterm.font("FiraCode Nerd Font", {weight="Medium", stretch="Normal", style="Normal"}),
    font_size = 11,
    color_scheme = "Spacedust",
    hide_tab_bar_if_only_one_tab = true,
    window_close_confirmation = 'AlwaysPrompt',
    colors = {
        cursor_bg = '#5c230d',
    },
    keys = {
        { key = 'j', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTabRelative(-1) },
        { key = 'k', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTabRelative(1) },
        { key = 'w', mods = 'CTRL', action = wezterm.action.CloseCurrentTab {confirm = true}}
    },
    freetype_render_target = 'HorizontalLcd'
}

