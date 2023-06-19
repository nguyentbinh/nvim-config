local M = {}

function M.setup()
  require"diffview".setup {
    file_panel = {
      listing_style = "tree",             -- One of 'list' or 'tree'
      tree_options = {                    -- Only applies when listing_style is 'tree'
        flatten_dirs = true,              -- Flatten dirs that only contain one single dir
        folder_statuses = "only_folded",  -- One of 'never', 'only_folded' or 'always'.
      },
      win_config = {                      -- See ':h diffview-config-win_config'
        position = "bottom",
        height = 20,
      }
    },
    file_history_panel = {
      log_options = {   -- See ':h diffview-config-log_options'
        git = {
          single_file = {
            diff_merges = "combined",
          },
          multi_file = {
            diff_merges = "first-parent",
          },
        },
      },
      win_config = {    -- See ':h diffview-config-win_config'
        position = "bottom",
        height = 20,
      }
    }
  }
end

return M
