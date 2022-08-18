local M = {}

function M.setup()
  require'dressing'.setup {
    input = {
      relative = "editor"
    },

    select = {
      backend = { 'telescope', 'fzf', 'builtin' },
      telescope = require'telescope.themes'.get_dropdown {
        initial_mode = "normal",
      }
    }
  }
end

return M
