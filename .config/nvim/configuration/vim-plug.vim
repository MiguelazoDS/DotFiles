call plug#begin('~/.config/nvim/plugged')
" ==================================================
" Style
" ==================================================
Plug 'Mofiqul/vscode.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'luochen1990/rainbow'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'onsails/lspkind-nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-lualine/lualine.nvim'
" Plug 'RRethy/vim-illuminate'
" Plug 'SmiteshP/nvim-gps'
Plug 'yamatsum/nvim-cursorline'


" ===================================================
" Latex/Markdown/vagrant/plantuml
" ===================================================
Plug 'lervag/vimtex'
Plug 'gabrielelana/vim-markdown'
Plug 'rhysd/vim-gfm-syntax'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'hashivim/vim-vagrant'
" ===================================================
" Code editing
" ===================================================
Plug 'm-demare/hlargs.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer', {'branch': 'main'}
Plug 'dense-analysis/ale'
" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-cmdline'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" Plug 'folke/trouble.nvim', {'branch': 'main'}
" Plug 'simrat39/symbols-outline.nvim'
Plug 'mtdl9/vim-log-highlighting'
" "Git
Plug 'lewis6991/gitsigns.nvim'
" Plug 'airblade/vim-gitgutter'
" Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
" "Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'sakhnik/nvim-gdb'
Plug 'rcarriga/nvim-dap-ui'
Plug 'Pocco81/DAPInstall.nvim'

"Misc
"===================================================
Plug 'uga-rosa/cmp-dictionary'
Plug 'SirVer/ultisnips'
" Plug '907th/vim-auto-save'
Plug 'tpope/vim-surround'
Plug 'lambdalisue/suda.vim'
Plug 'qpkorr/vim-renamer'
Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'kevinhwang91/rnvimr', {'branch': 'main'}
" Plug 'rbgrouleff/bclose.vim'
Plug 'psliwka/vim-smoothie'
Plug 'justinmk/vim-sneak'
" Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'
Plug 'tpope/vim-repeat'
Plug 'preservim/nerdcommenter'
Plug 'kyazdani42/nvim-tree.lua'
" Plug 'skywind3000/asynctasks.vim'
" Plug 'skywind3000/asyncrun.vim'
" Plug 'folke/which-key.nvim', {'branch': 'main'}

" ==================================================
" Terminal
" ==================================================
Plug 'akinsho/toggleterm.nvim'
" Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'nvim-telescope/telescope.nvim'
call plug#end()
