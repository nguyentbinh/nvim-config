local M = {}

local nls = require'null-ls'
local nls_utils = require'null-ls.utils'
local b = nls.builtins

local with_diagnostics_code = function(builtin)
  return builtin.with {
    diagnostics_format = "#{m} [#{c}]",
  }
end

local with_root_file = function(builtin, file)
  return builtin.with {
    condition = function(utils)
      return utils.root_has_file(file)
    end,
  }
end

local sources = {
  -- formatting
  b.formatting.black.with { extra_args = { "--fast" } },
  b.formatting.isort,
  b.formatting.prettierd,
  b.formatting.fixjson,
  b.formatting.sqlfluff.with({
    extra_args = { "--dialect", "postgres" }
  }),

  -- diagnostics
  b.diagnostics.codespell,
  b.diagnostics.actionlint,
  -- with_root_file(b.diagnostics.selene, "selene.toml"),
  with_diagnostics_code(b.diagnostics.shellcheck),
  b.diagnostics.sqlfluff.with({
    extra_args = { "--dialect", "postgres" }
  }),
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
