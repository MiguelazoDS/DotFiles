local wezterm = require 'wezterm'

return {
    warn_about_missing_glyphs = false,
    front_end = "OpenGL",
    font = wezterm.font("FiraCode Nerd Font", {weight="DemiBold", stretch="Normal", style="Normal"}),
    font_size = 12,
    display_pixel_geometry = "RGB",
    color_scheme = "Afterglow (Gogh)",
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

    window_background_gradient = {
    -- Can be "Vertical" or "Horizontal".  Specifies the direction
    -- in which the color gradient varies.  The default is "Horizontal",
    -- with the gradient going from left-to-right.
    -- Linear and Radial gradients are also supported; see the other
    -- examples below
      orientation = 'Horizontal',

      -- Specifies the set of colors that are interpolated in the gradient.
      -- Accepts CSS style color specs, from named colors, through rgb
      -- strings and more
      colors = {
        '#12141c',
        '#2b323d',
        '#435169',
        '#20242e',
        '#2b323d',
      },

      -- Instead of specifying `colors`, you can use one of a number of
      -- predefined, preset gradients.
      -- A list of presets is shown in a section below.
       --preset = "Warm",

      -- Specifies the interpolation style to be used.
      -- "Linear", "Basis" and "CatmullRom" as supported.
      -- The default is "Linear".
      interpolation = 'Basis',

      -- How the colors are blended in the gradient.
      -- "Rgb", "LinearRgb", "Hsv" and "Oklab" are supported.
      -- The default is "Rgb".
      blend = 'LinearRgb',

      -- To avoid vertical color banding for horizontal gradients, the
      -- gradient position is randomly shifted by up to the `noise` value
      -- for each pixel.
      -- Smaller values, or 0, will make bands more prominent.
      -- The default value is 64 which gives decent looking results
      -- on a retina macbook pro display.
       noise = 10,

      -- By default, the gradient smoothly transitions between the colors.
      -- You can adjust the sharpness by specifying the segment_size and
      -- segment_smoothness parameters.
      -- segment_size configures how many segments are present.
      -- segment_smoothness is how hard the edge is; 0.0 is a hard edge,
      -- 1.0 is a soft edge.

       segment_size = 1000,
       segment_smoothness = 0.0,
    }
}

