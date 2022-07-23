set nocompatible
set sw=2

call plug#begin('~/.local/share/nvim/plugged')

" LSP
Plug 'neovim/nvim-lspconfig'
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

Plug 'f3fora/cmp-spell'
Plug 'uga-rosa/cmp-dictionary'
Plug 'lukas-reineke/cmp-rg'

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'sheerun/vim-polyglot'

" Fuzzy Searching
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Git
Plug 'sindrets/diffview.nvim'
Plug 'airblade/vim-gitgutter'

" Useful tools to make life easier
Plug 'github/copilot.vim'

Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}

Plug 'numToStr/Comment.nvim'

Plug 'matze/vim-move'

Plug 'windwp/nvim-autopairs'
Plug 'kylechui/nvim-surround'

Plug 'kyazdani42/nvim-tree.lua'

Plug 'machakann/vim-highlightedyank'
Plug 'lukas-reineke/indent-blankline.nvim'

" Interface
Plug 'onsails/lspkind.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'EdenEast/nightfox.nvim'

call plug#end()

let g:mapleader = "\<Space>"

lua require("init")

source $HOME/.config/nvim/plugin.vim
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/mapping.vim
