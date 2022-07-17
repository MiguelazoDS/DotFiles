source $HOME/.config/nvim/configuration/vim-plug.vim
source $HOME/.config/nvim/configuration/color.vim
source $HOME/.config/nvim/configuration/mapping.vim
source $HOME/.config/nvim/configuration/general.vim
source $HOME/.config/nvim/configuration/templates.vim
source $HOME/.config/nvim/configuration/tex.vim
source $HOME/.config/nvim/configuration/terminal.vim
source $HOME/.config/nvim/configuration/hasktags.vim
source $HOME/.config/nvim/configuration/ultisnips.vim
source $HOME/.config/nvim/configuration/blamer.vim
source $HOME/.config/nvim/configuration/markdown.vim
:lua require('style')
:lua require('evilline')
:lua require('treesitter')
:lua require('lsp')
:lua require('nvim-tree').setup{}
":lua require('diff')
":lua require('lsp_icons')
"" :lua require('which-key').setup{}
": lua require('nvim-tree').setup({view = {number = true, relativenumber = true}})
:lua require('hlargs').setup()
":lua require('gitsigns').setup()
:lua require('git')
:lua require('nvim-cmp')
":lua require("nvim-gps").setup()
:lua require('cursor_hl')
":lua require('neoscroll').setup()
