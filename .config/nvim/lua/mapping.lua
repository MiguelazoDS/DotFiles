-- Remaping
local map = vim.keymap.set
local opts = { noremap=true, silent=false }
local api = vim.api

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
map('i', 'ii', '<ESC>')
map({'n','v'}, 'Y', '"+y')
map('n', 'yl', '0"+y$', opts)
map('n', 'P', 'o<ESC>"+p', opts)
map('n', 'dl', '0d$', opts)

-- Buffer
map('n', 'gn', ':BufferLineCycleNext<CR>')
map('n', 'gp', ':BufferLineCyclePrev<CR>')
map('n', 'gc', ':bdelete<CR>')
map('n', 'gP', ':BufferLinePick<CR>')

-- Fzf mapping
map('n', '<C-p>', ':FZF<CR>', opts)
map('n', '<C-f>', ':Rg<CR>', opts)
map('n', '?', ':BLines<CR>', opts)
map('n', '¿', ':Lines<CR>', opts)

-- Format code
map('n', '<LEADER>fc', 'gg=G')

-- This unsets the 'last search pattern'
map('n', '<LEADER>;', ':noh<CR>:<backspace>', opts)

-- Toggle nvim-tree
map('n', '<LEADER>N', ':NvimTreeToggle<CR>')

-- Execute renamer
map('n', '<LEADER>R', ':Ren<CR>', opts)

-- Suda
map('n', '<LEADER>ws', ':w suda://%<CR>')

--Nerdcommenter
--Toogle single line comment
map('v', '++', '<plug>NERDCommenterToggle')
map('n', '++', '<plug>NERDCommenterToggle')

--Block comment
map('n', '<LEADER>cm', '<Plug>NERDCommenterMinimal')

--Sneak bindings
--Motion bindings
map('n', '<LEADER>s', '<Plug>Sneak_s')
map('n', '<LEADER>S', '<Plug>Sneak_S')

--Replace f,F,t and T behavior with Sneak
map('n', 'f', '<Plug>Sneak_f')
map('n', 'F', '<Plug>Sneak_F')
map('n', 't', '<Plug>Sneak_t')
map('n', 'T', '<Plug>Sneak_T')

-- Markdown preview
--nmap <leader>m <Plug>MarkdownPreviewToggle
map('n', '<LEADER>m', '<Plug>MarkdownPreviewToggle')

-- LSP mapping

api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
api.nvim_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)