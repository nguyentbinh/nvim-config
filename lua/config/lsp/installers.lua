local M = {}

function M.setup(servers, options)
  local lspconfig = require'lspconfig'

  require("mason").setup()

  require("mason-tool-installer").setup {
    ensure_installed = {
      -- Linter
      'actionlint',
      'ktlint',
      'sqlfluff',
      'codespell',
      'shellcheck',
      'write-good',

      -- Formatter
      'black',
      'isort',
      'prettierd',
      'fixjson',
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

    ["sumneko_lua"] = function()
      local opts = vim.tbl_deep_extend("force", options, servers["sumneko_lua"] or {})
      lspconfig.sumneko_lua.setup(require("lua-dev").setup(opts))
    end,

    ["tsserver"] = function()
      local opts = vim.tbl_deep_extend("force", options, servers["tsserver"] or {})
      require("typescript").setup {
        disable_commands = false,
        debug = false,
        server = opts,
      }
    end,
  }

end

return M
