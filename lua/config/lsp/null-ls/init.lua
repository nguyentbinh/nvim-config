local M = {}

local nls = require'null-ls'
local nls_utils = require'null-ls.utils'
local b = nls.builtins

local with_diagnostics_code = function(builtin)
  return builtin.with {
    diagnostics_format = "#{m} [#{c}]",
  }
end

local sources = {
  -- formatting
  b.formatting.black.with { extra_args = { "--fast" } },
  b.formatting.isort,
  b.formatting.prettierd.with {
    disabled_filetypes = { "json", "yaml" }
  },
  -- b.formatting.fixjson,
  b.formatting.sqlfluff.with {
    condition = function(utils)
      return utils.root_has_file(".sqlfluff")
    end,
  },

  -- diagnostics
  b.diagnostics.codespell,
  b.diagnostics.actionlint,
  with_diagnostics_code(b.diagnostics.shellcheck),
  b.diagnostics.sqlfluff.with {
    condition = function(utils)
      return utils.root_has_file(".sqlfluff")
    end,
  },
  b.diagnostics.write_good,

  -- code actions
  b.code_actions.gitsigns,
  b.code_actions.gitrebase,
  b.code_actions.shellcheck,

  -- hover
  b.hover.dictionary,
}

function M.setup(opts)
  nls.setup {
    -- debug = true,
    debounce = 150,
    save_after_format = false,
    sources = sources,
    on_attach = opts.on_attach,
    root_dir = nls_utils.root_pattern ".git",
  }
end

return M
