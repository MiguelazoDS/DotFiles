call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'frazrepo/vim-rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'lervag/vimtex'
Plug '907th/vim-auto-save'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'lambdalisue/suda.vim'
Plug 'qpkorr/vim-renamer'
Plug 'Yggdroot/indentLine'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'preservim/tagbar'
Plug 'MarcWeber/hasktags'
Plug 'psliwka/vim-smoothie'
Plug 'justinmk/vim-sneak'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'pearofducks/ansible-vim'
Plug 'hashivim/vim-vagrant'
Plug 'voldikss/vim-floaterm'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'cdelledonne/vim-cmake'
call plug#end()
