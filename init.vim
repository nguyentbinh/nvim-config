set nocompatible
set sw=2

call plug#begin('~/.local/share/nvim/plugged')

" LSP
Plug 'neovim/nvim-lspconfig', { 'tag': 'v0.1.*' }
Plug 'williamboman/nvim-lsp-installer'
" Plug 'williamboman/mason.nvim'
" Plug 'williamboman/mason-lspconfig.nvim'
" Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'
" Plug 'folke/lua-dev.nvim'
Plug 'b0o/schemastore.nvim'
" Plug 'jose-elias-alvarez/typescript.nvim'

" nvim-cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-copilot'

Plug 'lukas-reineke/cmp-rg', { 'tag': 'v1.3.*' }

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'RRethy/nvim-treesitter-textsubjects'

" Fuzzy Searching
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.*' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Useful tools to make life easier
Plug 'github/copilot.vim'

Plug 'tpope/vim-fugitive', { 'tag': 'v3.*' }
Plug 'sindrets/diffview.nvim'
Plug 'lewis6991/gitsigns.nvim'

Plug 'akinsho/toggleterm.nvim', { 'tag': 'v2.*' }

Plug 'numToStr/Comment.nvim', { 'tag': 'v0.6.*' }

Plug 'windwp/nvim-autopairs'
Plug 'kylechui/nvim-surround'

Plug 'kyazdani42/nvim-tree.lua'

Plug 'folke/which-key.nvim'

Plug 'lukas-reineke/indent-blankline.nvim', { 'tag': 'v2.*' }

Plug 'norcalli/nvim-colorizer.lua'

" Interface
Plug 'onsails/lspkind.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'EdenEast/nightfox.nvim'

call plug#end()

lua require("plugins").setup()
