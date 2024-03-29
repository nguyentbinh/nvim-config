local M = {}

function M.setup()
  vim.opt.list = true
  vim.opt.listchars:append("space:.")
  vim.opt.listchars:append("eol:↴")

  require"indent_blankline".setup {
    show_current_context = true,
    show_current_context_start = true,
    show_trailing_blankline_indent = false,
    use_treesitter = true,
    show_end_of_line = true,
    space_char_blankline = " ",
  }
end

return M
