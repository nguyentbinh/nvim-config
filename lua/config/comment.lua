local M = {}

function M.setup()
  require'Comment'.setup {
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
      line = 'gcc',
      block = 'gbc',
    },
    opleader = {
      line = 'gc',
      block = 'gb',
    },
    extra = {
      eol = 'gcA',
    },
    mappings = {
      basic = true,
      extra = true,
      extended = false,
    },
  }
end

return M
