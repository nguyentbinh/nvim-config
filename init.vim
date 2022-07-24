set nocompatible
set sw=2

call plug#begin('~/.local/share/nvim/plugged')

" LSP
Plug 'neovim/nvim-lspconfig', { 'tag': 'v0.1.*' }
Plug 'williamboman/nvim-lsp-installer'

" nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-copilot'
Plug 'hrsh7th/nvim-cmp'

Plug 'uga-rosa/cmp-dictionary'
Plug 'lukas-reineke/cmp-rg', { 'tag': 'v1.3.*' }

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'RRethy/nvim-treesitter-textsubjects'
" Plug 'sheerun/vim-polyglot'

" Fuzzy Searching
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.*' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Useful tools to make life easier
Plug 'github/copilot.vim'

Plug 'tpope/vim-fugitive', { 'tag': 'v3.*' }
Plug 'sindrets/diffview.nvim'
Plug 'airblade/vim-gitgutter'

Plug 'akinsho/toggleterm.nvim', { 'tag': 'v2.*' }

Plug 'numToStr/Comment.nvim', { 'tag': 'v0.6.*' }

Plug 'matze/vim-move', { 'tag': 'v1.*' }

Plug 'windwp/nvim-autopairs'
Plug 'kylechui/nvim-surround'

Plug 'kyazdani42/nvim-tree.lua'

Plug 'lukas-reineke/indent-blankline.nvim', { 'tag': 'v2.*' }

Plug 'norcalli/nvim-colorizer.lua'

" Interface
Plug 'onsails/lspkind.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'tomasiser/vim-code-dark'
Plug 'EdenEast/nightfox.nvim'

call plug#end()

source $HOME/.config/nvim/general.vim

lua require("init")

source $HOME/.config/nvim/plugin.vim

source $HOME/.config/nvim/mapping.vim
