local M = {}

local utils = require'utils'
local nls_utils = require'config.lsp.null-ls.utils'
local nls_sources = require'null-ls.sources'
local api = vim.api

local method = require("null-ls").methods.FORMATTING

local allow_autoformat_filetype = {
  terraform = true
}

function M.format()
  local view = vim.fn.winsaveview()
  vim.lsp.buf.format { async = true }
  vim.fn.winrestview(view)
  utils.info("Buffer formatted", "Formatting")
end

function M.setup(client, bufnr)
  local filetype = api.nvim_buf_get_option(bufnr, "filetype")

  local enable = false
  if M.has_formatter(filetype) then
    enable = client.name == "null-ls"
  else
    enable = not (client.name == "null-ls")
  end

  local enable_autoformat = false
  if allow_autoformat_filetype[filetype] ~= nil then
    enable_autoformat = allow_autoformat_filetype[filetype]
  end

  client.server_capabilities.documentFormattingProvder = enable
  client.server_capabilities.documentRangeFormattingProvider = enable
  if client.server_capabilities.documentFormattingProvider and enable_autoformat then
    local lsp_format_grp = api.nvim_create_augroup("LspFormat", { clear = true })
    api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        vim.schedule(M.format)
      end,
      group = lsp_format_grp,
      buffer = bufnr,
    })
  end
end

function M.has_formatter(filetype)
  local available = nls_sources.get_available(filetype, method)
  return #available > 0
end

function M.list_registered(filetype)
  local registered_providers = nls_utils.list_registered_providers_names(filetype)
  return registered_providers[method] or {}
end

function M.list_supported(filetype)
  local supported_formatters = nls_sources.get_supported(filetype, "formatting")
  table.sort(supported_formatters)
  return supported_formatters
end

return M
