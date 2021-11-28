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
:lua require('nvim-compe')
" :lua require('lsp_icons')
" :lua require('which-key').setup{}
