local config = vim.lsp.config

config('asm_lsp', {
  root_dir = require('lspconfig.util').root_pattern('./'),
  filetypes = { "nasm" }
})
config('bashls', {})
config('clangd', {})
config('cmake', {})
config('diagnosticls', {})
config('dockerls', {
	    settings = {
        docker = {
	    languageserver = {
	        formatter = {
		    ignoreMultilineInstructions = true,
		},
	    },
	}
    }
})
config('grammarly', {})
config('hls', {})
config('jsonls', {})
config('lemminx', {})
config('lua_ls', {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})
config('.marksman', {})
config('.pyright', {})
config('.sqlls', {
  root_dir = require('lspconfig.util').root_pattern('./'),
})
config('.texlab', {})
config('.yamlls', {})
config('.veridian', {
  root_dir = require('lspconfig.util').root_pattern('./'),
  filetypes = { "verilog" }
})
config('.autotools_ls', {})

vim.g['LanguageClient_serverCommands'] = { 'sql', { 'sql-language-server', 'up', '--method', 'stdio' } }

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "autotools_ls",
    "asm_lsp",
    "bashls",
    "clangd",
    "cmake",
    "diagnosticls",
    "dockerls",
    "grammarly",
    "hls",
    "jsonls",
    "lemminx",
    "lua_ls",
    "marksman",
    "pyright",
    "sqlls",
    "texlab" },                     -- ensure these servers are always installed
  automatic_installation = true,    -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
}

require('lspkind').init({
  -- DEPRECATED (use mode instead): enables text annotations
  --
  -- default: true
  -- with_text = true,

  -- defines how annotations are shown
  -- default: symbol
  -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
  mode = 'symbol_text',

  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  --
  -- default: 'default'
  preset = 'codicons',

  -- override preset symbols
  --
  -- default: {}
  symbol_map = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = ""
  },
})
