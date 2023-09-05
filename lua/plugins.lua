local M = {}

function M.setup()
  require'default'

  require'config.whichkey'.setup()
  require'config.lsp'.setup()
  require'config.bufferline'.setup()
  require'config.cmp'.setup()
  require'config.comment'.setup()
  require'config.copilot'.setup()
  require'config.diffview'.setup()
  require'config.dressing'.setup()
  require'config.gitsigns'.setup()
  require'config.indent-blankline'.setup()
  require'config.lualine'.setup()
  require'config.nvim-autopairs'.setup()
  require'config.nvim-colorizer'.setup()
  require'config.nvim-notify'.setup()
  require'config.nvim-surround'.setup()
  require'config.nvim-tree'.setup()
  require'config.nvim-treesitter'.setup()
  require'config.nvim-treesitter-context'.setup()
  require'config.telescope'.setup()
  require'config.toggleterm'.setup()
end

return M
