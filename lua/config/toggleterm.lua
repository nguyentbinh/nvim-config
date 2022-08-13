local M = {}

function M.setup()
  require'toggleterm'.setup {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 1,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    persist_mode = false,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
    },
  }

  function _G.set_terminal_keymaps()
    local opts = { noremap = true, silent = true, buffer = 0 }
    vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", opts)
    vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
    vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)
    vim.keymap.set("t", "<C-j>", "<C-\\<C-n><C-w>j", opts)
    vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
  end
  vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"
end

return M
