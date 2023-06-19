local highlighted_yank = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = highlighted_yank,
})

local cursor_line = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  pattern = "*",
  command = "set cursorline",
  group = cursor_line,
})
vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
  pattern = "*",
  command = "set nocursorline",
  group = cursor_line,
})

vim.api.nvim_create_autocmd("FocusGained", { command = ":checktime" })

-- Terraform set filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tf",
  command = "set filetype=terraform"
})
