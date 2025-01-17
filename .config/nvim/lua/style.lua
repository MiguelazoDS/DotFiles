-- ============================================================
-- nvim devicons configuration
-- ===========================================================

-- Overrides highlights custom config. Othewise things like diagnostics do not reflect changes.
local colors = require("gruvbox-baby.colors").config({
  color_overrides = {
    background = "#202020",
    medium_gray = "#78797a",
    soft_yellow = "#db9a27",
    soft_green = "#8d8f18",
    bright_yellow = "#f2ce79",
    orange = "#b04c0b",
    red = "#db3e2c",
    error_red = "#b32727",
    magenta = "#7c76cf",
    pink = "#e37f7f",
    light_blue = "#5ac1db",
    dark_gray = "#3a495c",
    blue_gray = "#386eab",
    forest_green = "#3d7037",
    clean_green = "#438c3b"
  }
})

-- Overrides local highlights. Otherwise it is not updated.
vim.g.gruvbox_baby_color_overrides = {
  background = "#202020",
  medium_gray = "#78797a",
  soft_yellow = "#db9a27",
  soft_green = "#8d8f18",
  bright_yellow = "#f2ce79",
  orange = "#b04c0b",
  red = "#db3e2c",
  error_red = "#b32727",
  magenta = "#7c76cf",
  pink = "#e37f7f",
  light_blue = "#5ac1db",
  dark_gray = "#3a495c",
  blue_gray = "#386eab",
  forest_green = "#3d7037",
  clean_green = "#438c3b"
}


-- Custom highlights
local util = require("gruvbox-baby.util")
local config = require("gruvbox-baby.config")
-- Use :Inspect to determine the group
vim.g.gruvbox_baby_highlights = {
  ["@function.builtin"] = { fg = colors.orange, style = config.function_style },
  ["@punctuation.bracket"] = { fg = colors.milk },
  DiagnosticError = { fg = colors.error_red },
  DiagnosticVirtualTextError = { fg = colors.error_red, bg = util.darken(colors.error_red, 0.1, colors.dark) },
  DiagnosticVirtualTextWarn = { fg = colors.soft_yellow, bg = util.darken(colors.soft_yellow, 0.1, colors.dark) },
  ["@lsp.type.enumMember.c"] = { fg = colors.pink },
  ["@Comment"] = { fg = colors.medium_gray }
}

-- Select color scheme
vim.cmd([[colorscheme gruvbox-baby]])

require 'nvim-web-devicons'.setup {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#8d8f18",
      cterm_color = "65",
      name = "Zsh"
    }
  },
  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true,
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true,
  -- globally enable "strict" selection of icons - icon will be looked up in
  -- different tables, first by filename, and if not found by extension; this
  -- prevents cases when file doesn't have any extension but still gets some icon
  -- because its name happened to match some extension (default to false)
  strict = true,
  -- same as `override` but specifically for overrides by filename
  -- takes effect when `strict` is true
  override_by_filename = {
    [".gitignore"] = {
      icon = "",
      color = "#8a1e1e",
      name = "Gitignore"
    }
  },
  -- same as `override` but specifically for overrides by extension
  -- takes effect when `strict` is true
  override_by_extension = {
    ["log"] = {
      icon = "",
      color = "#8d8f18",
      name = "Log"
    }
  },
}

-- ============================================================
-- Bufferline configuration.
-- ============================================================
require("bufferline").setup {
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    separator_style = "slant"
  }
}

require 'colorizer'.setup({
  filetypes = { 'lua' }
})
