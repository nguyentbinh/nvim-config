local M = {}

function M.setup()
  require'nvim-autopairs'.setup {
    disable_filetype = { "TelescopePrompt" },
    enable_check_bracket_line = true,
    map_cr = true,
    check_ts = true,
  }
end

return M
