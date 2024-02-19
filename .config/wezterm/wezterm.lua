local wezterm = require 'wezterm'
local my_default = wezterm.color.get_default_colors()

return {
  scrollback_lines = 10000,
  warn_about_missing_glyphs = false,
  front_end = "OpenGL",
  font = wezterm.font("FiraCode Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" }),
  font_size = 13,
  display_pixel_geometry = "RGB",
  color_scheme = 'Gruvbox Material (Gogh)',
  hide_tab_bar_if_only_one_tab = true,
  window_close_confirmation = 'AlwaysPrompt',
  window_frame = {
    active_titlebar_bg = '#333333',
    -- The overall background color of the tab bar when
    -- the window is not focused
    inactive_titlebar_bg = '#333333',
  },
  colors = {
    cursor_bg = '#ab5324',
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
