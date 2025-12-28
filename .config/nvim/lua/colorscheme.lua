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

