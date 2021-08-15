local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
require('telescope').setup{
    defaults = {
        mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-p>"] = builtin.find_files,
              ["<C-f>"] = builtin.live_grep
            }
        },
    }
}

vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope live_grep<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-n>', ':Telescope file_browser<CR>', { noremap = true, silent = true})
