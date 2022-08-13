local M = {}

function M.setup()
  local config = {
    float = {
      border = 'single'
    },

    diagnostic = {
      virtual_text = true,
      signs = false,
      underline = false,
      update_in_insert = false,
      severity_sort = false,
    },
  }

  vim.diagnostic.config(config.diagnostic)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, config.float)
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, config.float)
end

return M
