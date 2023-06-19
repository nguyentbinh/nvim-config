local M = {}

function M.setup(client, bufnr)
  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { noremap=true, silent=true }
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '[e', "<CMD>lua vim.diagnostic.goto_prev({severity=vim.diagnostic.severity.ERROR})<CR>", opts)
  vim.keymap.set('n', ']e', "<CMD>lua vim.diagnostic.goto_next({severity=vim.diagnostic.severity.ERROR})<CR>", opts)
  vim.keymap.set('n', '<C-q>', vim.diagnostic.setqflist, opts)

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<leader>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)

  -- whichkey
  local whichkey = require'which-key'
  local keymap = {
    l = {
      name = "LSP",
      I = { "<CMD>LspInfo<CR>", "Info" },
      a = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
      d = { "<CMD>Telescope lsp_definitions<CR>", "Definition" },
      D = { "<CMD>Telescope lsp_type_definitions<CR>", "Type Definition" },
      i = { "<CMD>Telescope lsp_implementations<CR>", "Implementation" },
      h = { "<CMD>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
      q = { "<CMD>lua vim.diagnostic.setqflist()<CR>", "Diagnostic to Quickfix" },
      n = { "<CMD>lua vim.lsp.buf.rename()<CR>", "Rename" },
      r = { "<CMD>Telescope lsp_references<CR>", "References" },
      l = { "<CMD>lua print(vim.inspect(vim.lsp.buf_get_clients()))<CR>", "List LSP Clients" },
    }
  }

  if client.server_capabilities.documentFormattingProvider then
    keymap.l.f = { "<CMD>lua vim.lsp.buf.format { async = true }<CR>", "Format" }
  end

  whichkey.register(keymap, { noremap=true, buffer=bufnr, prefix='<leader>' })
end

return M
