local M = {}

function M.setup()
  require 'colorizer'.setup {
    'css';
    'javascript';
    'html';
    'lua';
    'vim'
  }
end

return M
