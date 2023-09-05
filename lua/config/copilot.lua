local M = {}

function M.setup()
  require"copilot".setup {
    suggestion = {
      enabled = false,
    },

    panel = {
      enabled = false,
    },
  }

  require"copilot_cmp".setup {}
end

return M
