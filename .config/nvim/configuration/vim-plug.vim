call plug#begin('~/.config/nvim/plugged')
" Color/Style
Plug 'tomasiser/vim-code-dark'
Plug 'frazrepo/vim-rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'onsails/lspkind-nvim'
Plug 'romgrk/barbar.nvim'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kosayoda/nvim-lightbulb'
"==============================
Plug 'folke/trouble.nvim'
Plug 'folke/lsp-colors.nvim'
"==============================
" Latex/Markdown/vagrant
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'hashivim/vim-vagrant'
" Snippets
Plug 'SirVer/ultisnips'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'
" Misc
Plug 'simrat39/symbols-outline.nvim'
Plug '907th/vim-auto-save'
Plug 'tpope/vim-surround'
Plug 'lambdalisue/suda.vim'
Plug 'qpkorr/vim-renamer'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'preservim/tagbar'
Plug 'MarcWeber/hasktags'
Plug 'psliwka/vim-smoothie'
Plug 'justinmk/vim-sneak'
Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'
" Terminal
Plug 'voldikss/vim-floaterm'
Plug 'akinsho/nvim-toggleterm.lua'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" LSP/Diagnostic
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'dense-analysis/ale'
" Autocompletion
Plug 'hrsh7th/nvim-compe'
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()
