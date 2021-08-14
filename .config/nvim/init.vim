"Vim-plug plugins
"=================================================
source $HOME/.config/nvim/configuration/vim-plug.vim

"Color scheme & Airline
"=================================================
source $HOME/.config/nvim/configuration/color.vim

"Key binding
"=================================================
source $HOME/.config/nvim/configuration/mapping.vim

"General
"=================================================
source $HOME/.config/nvim/configuration/general.vim

"Languages templates
"=================================================
source $HOME/.config/nvim/configuration/templates.vim

"Latex configuration
"=================================================
source $HOME/.config/nvim/configuration/tex.vim

"Terminal
"=================================================
source $HOME/.config/nvim/configuration/terminal.vim

"Hasktags
"==================================================
source $HOME/.config/nvim/configuration/hasktags.vim

"UltiSnips
source $HOME/.config/nvim/configuration/ultisnips.vim

"Coc configuration
"==================================================
" source $HOME/.vim/$HOME/.config/nvim/configuration/coc.vim

source $HOME/.config/nvim/configuration/markdown.vim
:lua require('evilline')
:lua require('treesitter')
:lua require('lsp')
:lua require('nvim-compe')
source $HOME/.config/nvim/configuration/barbar.vim

