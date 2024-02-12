-- ============================================================
-- nvim devicons configuration
-- ===========================================================

vim.cmd([[set termguicolors]])
local config = require("gruvbox-baby.config")
vim.g.function_style = "NONE"
vim.g.variable_style = "NONE"

-- Color overrides gruvbox_baby
-- It does not work when using with colors.<color>.
vim.g.gruvbox_baby_color_overrides = {
  --https://github.com/luisiacc/gruvbox-baby/blob/bd52e62d8134647090108189e69c8b3cd18bdbbf/lua/gruvbox-baby/colors.lua#L103
}

local colors = require("gruvbox-baby.colors").config()
local util = require("gruvbox-baby.util")
vim.g.gruvbox_baby_highlights = {
  ["@function.builtin"] = { fg = colors.orange, style = config.function_style },
  DiagnosticError = { fg = colors.error_red },
  DiagnosticVirtualTextError = { fg = colors.error_red, bg = util.darken(colors.error_red, 0.1, colors.dark) },
  DiagnosticVirtualTextWarn = { fg = colors.soft_yellow, bg = util.darken(colors.soft_yellow, 0.1, colors.dark) }
}
vim.cmd([[colorscheme gruvbox-baby]])

require 'nvim-web-devicons'.setup {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
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
      color = "#f1502f",
      name = "Gitignore"
    }
  },
  -- same as `override` but specifically for overrides by extension
  -- takes effect when `strict` is true
  override_by_extension = {
    ["log"] = {
      icon = "",
      color = "#81e043",
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
    end
  }
}

require 'colorizer'.setup()

--[[require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 100,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}]]
