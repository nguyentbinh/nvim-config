local opts = { noremap = true }
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, silent = true, expr = true }

vim.api.nvim_set_keymap("n", ";", ":", opts)

vim.api.nvim_set_keymap("n", "<leader><backspace>", ":noh<CR>", default_opts)

vim.api.nvim_set_keymap("n", "n", "nzz", default_opts)
vim.api.nvim_set_keymap("n", "N", "Nzz", default_opts)

vim.api.nvim_set_keymap("n", "<C-j>", "<C-w><C-j>", default_opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w><C-k>", default_opts)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w><C-h>", default_opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w><C-l>", default_opts)

vim.api.nvim_set_keymap("n", "<Up>", "<C-w>5+", default_opts)
vim.api.nvim_set_keymap("n", "<Down>", "<C-w>5-", default_opts)
vim.api.nvim_set_keymap("n", "<Left>", "<C-w>5<", default_opts)
vim.api.nvim_set_keymap("n", "<Right>", "<C-w>5>", default_opts)

vim.api.nvim_set_keymap("", "<leader>y", [["+y]], default_opts)
vim.api.nvim_set_keymap("", "<leader>p", [["+p]], default_opts)
vim.api.nvim_set_keymap("", "<leader>P", [["+P]], default_opts)
