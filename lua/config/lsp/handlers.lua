local M = {}

local utils = require 'config.lsp.utils'

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

  vim.lsp.handlers["window/showMessage"] = utils.setup_message

  vim.lsp.handlers["$/progress"] = utils.setup_progress
end

return M
