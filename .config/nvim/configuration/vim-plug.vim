call plug#begin('~/.config/nvim/plugged')
"Style
"===================================================
Plug 'tomasiser/vim-code-dark'
Plug 'luochen1990/rainbow'
" Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'onsails/lspkind-nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'norcalli/nvim-colorizer.lua'
"===================================================
"Latex/Markdown/vagrant
"===================================================
Plug 'lervag/vimtex'
Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'hashivim/vim-vagrant'
"===================================================
"Code editing
"===================================================
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall', {'branch': 'main'}
Plug 'dense-analysis/ale'
Plug 'hrsh7th/nvim-compe'
Plug 'folke/trouble.nvim', {'branch': 'main'}
Plug 'simrat39/symbols-outline.nvim'
"Git
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-fugitive'
"Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Misc
"===================================================
Plug 'SirVer/ultisnips'
Plug '907th/vim-auto-save'
Plug 'tpope/vim-surround'
Plug 'lambdalisue/suda.vim'
Plug 'qpkorr/vim-renamer'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kevinhwang91/rnvimr', {'branch': 'main'}
Plug 'rbgrouleff/bclose.vim'
Plug 'psliwka/vim-smoothie'
Plug 'justinmk/vim-sneak'
Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'
Plug 'tpope/vim-repeat'
Plug 'preservim/nerdcommenter'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
" Plug 'folke/which-key.nvim', {'branch': 'main'}
" Terminal
Plug 'voldikss/vim-floaterm'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
