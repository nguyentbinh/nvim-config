local M = {}

function M.setup(servers, options)
  local lspconfig = require'lspconfig'

  require("nvim-lsp-installer").setup({
    automatic_installation = true -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  })

  for server, server_option in pairs(servers) do
    local opts = vim.tbl_deep_extend("force", options, server_option or {})
    lspconfig[server].setup(opts)
  end
end

return M
