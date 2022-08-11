vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.compatible = false
vim.opt.encoding = 'utf-8'
vim.opt.fileformat = 'unix'
-- vim.opt.clipboard = 'unnamedplus'
vim.opt.termguicolors = true

vim.opt.completeopt = "menu,menuone,noselect"

vim.opt.wildmenu = true
vim.opt.wildignore:append(".git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*")
vim.opt.wildignore:append("*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store")
vim.opt.wildignore:append("__pycache__,*.egg-info")

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wrap = false

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.path:append("**")

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.inccommand = "nosplit"

vim.opt.showmatch = true
vim.opt.showcmd = true
vim.opt.showmode = false

vim.opt.colorcolumn = '120'

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.cmd [[
  augroup nvimtreenonumber
    autocmd!
    autocmd BufEnter, FocusGained NvimTree setlocal nonumber norelativenumber
    autocmd BufLeave, FocusLost NvimTree setlocal nonumber norelativenumber
  augroup END
]]

vim.cmd [[
  augroup cursorline
    autocmd!
    autocmd BufEnter,WinEnter * set cursorline
    autocmd BufLeave,WinLeave * set nocursorline
  augroup END
]]

vim.cmd [[
  augroup HighlightedYank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=1000}
  augroup END
]]
