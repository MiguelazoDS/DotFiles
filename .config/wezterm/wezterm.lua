local wezterm = require 'wezterm'
-- https://github.com/wez/wezterm/blob/main/config/src/scheme_data.rs
local my_color_scheme = wezterm.color.get_builtin_schemes()['Gnometerm (terminal.sexy)']
my_color_scheme.cursor_bg = '#ab5324'
my_color_scheme.background = '#303030'
my_color_scheme.foreground = '#d1c3a5'
--my_color_scheme.selection_fg = 'black'
--my_color_scheme.selection_bg = '#000000'
my_color_scheme.ansi = {
  "#000000", "#b02a2a", "#4e9a06", "#c4a000", "#3465a4", "#75507b", "#06989a", "#d3d7cf"
}
my_color_scheme.brights = {
  "#909090", "#ed4747", "#8ae234", "#fce94f", "#729fcf", "#ad7fa8", "#34e2e2", "#d1c3a5"
}

return {
  scrollback_lines = 10000,
  warn_about_missing_glyphs = false,
  front_end = "OpenGL",
  font = wezterm.font("FiraCode Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" }),
  font_size = 13.5,
  display_pixel_geometry = "RGB",
  color_schemes = {
    ['My Theme'] = my_color_scheme
  },
  color_scheme = 'My Theme',
  hide_tab_bar_if_only_one_tab = true,
  window_close_confirmation = 'AlwaysPrompt',
  use_resize_increments = true,
  window_frame = {
    active_titlebar_bg = '#333333',
    inactive_titlebar_bg = '#333333',
    border_left_width = '0cell',
    border_right_width = '0cell',
    border_bottom_height = '0cell',
    border_top_height = '0cell',
  },
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  window_background_image = '/home/miguel/.Wallpapers/1920x1080/assortment-chess-pieces-with-dramatic-scenery.png',
  window_background_image_hsb = {
    hue = 1,
    brightness = 0.05,
    saturation = 0.75
  },
  keys = {
    { key = 'j', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTabRelative(-1) },
    { key = 'k', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTabRelative(1) },
  },
  freetype_load_target = "Normal",
  freetype_render_target = 'Normal',
  freetype_load_flags = 'NO_BITMAP',
  window_background_opacity = 1,
  text_background_opacity = 1,
}
