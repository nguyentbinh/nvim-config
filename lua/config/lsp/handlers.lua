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

  vim.lsp.handlers["window/showMessage"] = function(err, method, params, client_id)
    local client = vim.lsp.get_client_by_id(client_id)
    local severity = ({
      'ERROR',
      'WARN',
      'INFO',
      'DEBUG',
    })[params.type]
    vim.notify(method.message, severity, {
      title = 'LSP - ' .. client.name,
    })
  end
end

return M
