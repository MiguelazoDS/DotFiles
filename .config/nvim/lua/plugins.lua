return require('packer').startup(function(use)
    -- Plugin manager
    use 'wbthomason/packer.nvim'
    -- LSP
    use {
        "williamboman/nvim-lsp-installer",
        "neovim/nvim-lspconfig",
    }
    use 'onsails/lspkind-nvim'
    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-calc'
    use 'hrsh7th/cmp-cmdline'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    use 'uga-rosa/cmp-dictionary'
    -- Linters
    use 'dense-analysis/ale'
    -- Statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- Tabline
    use 'akinsho/bufferline.nvim'
    -- Colorscheme
    use 'Mofiqul/vscode.nvim'
    -- Icons
    use 'nvim-tree/nvim-web-devicons'
    -- Fuzzy finder
    use { 'junegunn/fzf', run = './install --bin', }
    use 'junegunn/fzf.vim'
    -- Highlighting
    use 'luochen1990/rainbow'
    use 'mtdl9/vim-log-highlighting'
    use {
        'm-demare/hlargs.nvim',
        requires = { 'nvim-treesitter/nvim-treesitter' }
    }
    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    -- Latex/Markdown/vagrant/plantuml
    use 'lervag/vimtex'
    use 'gabrielelana/vim-markdown'
    use 'rhysd/vim-gfm-syntax'
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install'
    }
    use 'hashivim/vim-vagrant'
    -- Motion
    use 'psliwka/vim-smoothie'
    use 'justinmk/vim-sneak'
    use 'preservim/nerdcommenter'
    -- Style
    use 'norcalli/nvim-colorizer.lua'
    use 'lukas-reineke/indent-blankline.nvim'
    -- Misc
    use 'lambdalisue/suda.vim'
    use 'SirVer/ultisnips'
    use 'tpope/vim-surround'
    use 'qpkorr/vim-renamer'
    use 'ervandew/supertab'
    use 'tpope/vim-repeat'
    -- Git
    use 'lewis6991/gitsigns.nvim'
    -- File manager
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
end)
