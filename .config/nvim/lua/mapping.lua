local map = vim.keymap.set
local mapd = vim.keymap.del
local api = vim.api
local opts = { noremap=true, silent=false }

-- Format code
map('n', '<LEADER>fc', 'gg=G')

-- This unsets the 'last search pattern'
map('n', '<LEADER>;', ':noh<CR>:<backspace>', opts)

-- Execute renamer
map('n', '<LEADER>R', ':Ren<CR>', opts)

-- Yank and Paste mapping
map({'n','v'}, 'Y', '"+y')
map('n', 'yl', '0"+y$', opts)
map('n', 'P', 'o<ESC>"+p', opts)
map('n', 'dl', '0d$', opts)

-- NvimTree
map('n', '<LEADER>N', ':NvimTreeToggle<CR>')

-- Bufferline
map('n', 'gn', ':BufferLineCycleNext<CR>')
map('n', 'gp', ':BufferLineCyclePrev<CR>')
-- Disable default gcc commenting action
pcall(mapd, 'n', 'gcc')
map('n', 'gc', ':bdelete<CR>')
map('n', 'gP', ':BufferLinePick<CR>')

-- Fzf
map('n', '<C-p>', ':FzfLua files<CR>', opts)
map('n', '<C-f>', ':FzfLua live_grep_native<CR>', opts)
map('n', '?', ':FzfLua blines<CR>', opts)
map('n', '<C-b>', ':FzfLua buffers<CR>', opts)

-- Suda
map('n', '<LEADER>ws', ':w suda://%<CR>')

--Nerdcommenter
--Toogle single line comment
map('v', '++', '<plug>NERDCommenterToggle')
map('n', '++', '<plug>NERDCommenterToggle')
--Block comment
map('n', '<LEADER>cm', '<Plug>NERDCommenterMinimal')

-- LSP mapping
api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
api.nvim_set_keymap('n', '<space>ff', '<cmd>lua vim.lsp.buf.format({async = false})<CR>', opts)
api.nvim_set_keymap('n', '<space>k', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

-- Markdown preview
map('n', '<LEADER>m', '<Plug>MarkdownPreviewToggle')

-- Vimtex
map('n', '<LEADER>ll', '<Plug>(vimtex-compile)')
map('n', '<LEADER>lv', '<Plug>(vimtex-view)')

