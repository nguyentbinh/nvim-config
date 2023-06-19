local M = {}

function M.setup()
  local telescope = require'telescope'
  local actions = require'telescope.actions'

  telescope.setup {
    defaults = {
      prompt_prefix = "  ",
      selection_caret = " ",

      path_display = { "smart" },

      mappings = {
        n = {
          ["<C-b>"] = actions.preview_scrolling_up,
          ["<C-f>"] = actions.preview_scrolling_down,
        },
        i = {
          ["<C-b>"] = actions.preview_scrolling_up,
          ["<C-f>"] = actions.preview_scrolling_down,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<Down>"] = actions.cycle_history_next,
          ["<Up>"] = actions.cycle_history_prev,
        },
      },
    },

    pickers = {
      find_files = {
        hidden = true,
        find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
      },

      lsp_definitions = {
        initial_mode = "normal",
      },

      lsp_type_definitions = {
        initial_mode = "normal",
      },

      lsp_implementations = {
        initial_mode = "normal",
      },

      lsp_references = {
        initial_mode = "normal",
        theme = "dropdown",
        layout_config = {
          width = 0.5
        }
      }
    },

    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "ignore_case",       -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      },
    }
  }

  telescope.load_extension('fzf')
end

return M
