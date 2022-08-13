local M = {}

function M.setup()
  require"nvim-surround".setup {
    highlight = {
      duration = 1,
    },
    move_cursor = false,
  }
end

return M
