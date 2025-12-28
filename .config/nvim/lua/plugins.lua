return {
  -- LSP
  { "mason-org/mason.nvim",      opts = {} },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  "onsails/lspkind-nvim",
  -- Linters
  "dense-analysis/ale",
  -- File explorer
  "nvim-tree/nvim-tree.lua",
  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate" },
  -- Bufferline
  { "akinsho/bufferline.nvim",   version = "*",                                   dependencies = "nvim-tree/nvim-web-devicons" },
  -- Statusline
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  -- Colorscheme
  "luisiacc/gruvbox-baby",
  { "ibhagwan/fzf-lua",             dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {} },
  -- Highlighting
  "luochen1990/rainbow",
  "mtdl9/vim-log-highlighting",
  "m-demare/hlargs.nvim",
  -- Markdown
  "gabrielelana/vim-markdown",
  "rhysd/vim-gfm-syntax",
  { "iamcco/markdown-preview.nvim", build = "cd app && yarn install" },
  -- Misc
  "lambdalisue/suda.vim",
  { "preservim/nerdcommenter", init = function() vim.g.NERDCreateDefaultMappings = 0 end },
  "ervandew/supertab",
  -- Style
  "NvChad/nvim-colorizer.lua",
  -- Snippets
  "SirVer/ultisnips",
  -- Completion
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-calc",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "quangnguyen30192/cmp-nvim-ultisnips",
  "uga-rosa/cmp-dictionary",
  -- Git
  "lewis6991/gitsigns.nvim",
  -- Latex
  {
    "lervag/vimtex",
    lazy = false, -- we don"t want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    end
  },
  "tpope/vim-repeat"
}
