local M = {}

function M.setup()
  local g = vim.g
  g.indent_blankline_filetype_exclude = { "help", "packer" }
  g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
  g.indent_blankline_show_trailing_blankline_indent = false

  -- vim.opt.list = true
  -- vim.opt.listchars:append("space:.")
  -- vim.opt.listchars:append("eol:")

  -- require"indent_blankline".setup {
  --   show_current_context = false,
  --   show_current_context_start = false,
  --   show_trailing_blankline_indent = false,
  --   use_treesitter = false,
  --   show_end_of_line = true,
  --   space_char_blankline = " ",
  -- }
end

return M
