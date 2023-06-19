local M = {}

function M.setup()
  local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    -- vim.keymap.set('n', 'O', '', { buffer = bufnr })
    -- vim.keymap.del('n', 'O', { buffer = bufnr })
    -- vim.keymap.set('n', '<2-RightMouse>', '', { buffer = bufnr })
    -- vim.keymap.del('n', '<2-RightMouse>', { buffer = bufnr })
    -- vim.keymap.set('n', 'D', '', { buffer = bufnr })
    -- vim.keymap.del('n', 'D', { buffer = bufnr })
    -- vim.keymap.set('n', 'E', '', { buffer = bufnr })
    -- vim.keymap.del('n', 'E', { buffer = bufnr })
    --
    -- vim.keymap.set('n', 'A', api.tree.expand_all, opts('Expand All'))
    -- vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    -- vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))
    -- vim.keymap.set('n', 'P', function()
    --   local node = api.tree.get_node_under_cursor()
    --   print(node.absolute_path)
    -- end, opts('Print Node Path'))
    --
    -- vim.keymap.set('n', 'Z', api.node.run.system, opts('Run System'))
  end

  require "nvim-tree".setup {
    on_attach = on_attach,
    hijack_netrw = true,
    respect_buf_cwd = true,
    sort_by = "case_insensitive",
    view = {
      adaptive_size = true,
      width = 50,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
    update_cwd = true,
    update_focused_file = {
      enable = true,
    },
  }

  vim.keymap.set("n", "<F2>", "<CMD>NvimTreeToggle<CR>", { noremap = true, silent = true })
end

return M
