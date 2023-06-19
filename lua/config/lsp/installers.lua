local M = {}

function M.setup(servers, options)
  local lspconfig = require'lspconfig'

  require("mason").setup()

  require("mason-tool-installer").setup {
    ensure_installed = {
      -- Linter
      'actionlint',
      'codespell',
      'shellcheck',
      'write-good',

      -- Formatter
      'black',
      'isort',
      'prettierd',
    },
    auto_update = false,
    -- run_on_start = true,
  }

  require("mason-lspconfig").setup {
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = true,
  }

  require("mason-lspconfig").setup_handlers {
    function(server_name)
      local opts = vim.tbl_deep_extend("force", options, servers[server_name] or {})
      lspconfig[server_name].setup(opts)
    end,
  }

end

return M
