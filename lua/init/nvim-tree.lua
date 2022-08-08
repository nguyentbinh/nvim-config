require"nvim-tree".setup {
  sort_by = "case_insensitive",
  view = {
    adaptive_size = true,
    width = 50,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}

vim.keymap.set("n", "<F2>", "<CMD>NvimTreeToggle<CR>", { noremap = true, silent = true })
