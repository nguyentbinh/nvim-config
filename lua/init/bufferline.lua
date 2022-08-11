local M = {}

function M.setup()
  require'bufferline'.setup {
    options = {
      mode = "buffers", -- set to "tabs" to only show tabpages instead
      close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      offsets = {
        { filetype = "NvimTree", text = "File Explorer" },
      },
      separator_style = "slant",
      max_name_length = 20,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      tab_size = 20,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
          if context.buffer:current() then
            local icon = level:match("error") and " " or ""
            return " " .. count .. icon
          end
          return ''
      end,
      diagnostics_update_in_insert = true,
      numbers = "ordinal",
      color_icons = true, -- whether or not to add the filetype icon highlights
      show_buffer_icons = true, -- disable filetype icons for buffers
      show_buffer_close_icons = false,
      show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      enforce_regular_tabs = true,
      always_show_bufferline = true,
      sort_by = 'insert_after_end',
    },
  }

  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "<S-q>", "<CMD>bdelete!<CR>", opts)
  vim.keymap.set("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>", opts)
  vim.keymap.set("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>", opts)
  vim.keymap.set("n", "[b", "<CMD>BufferLineMovePrev<CR>", opts)
  vim.keymap.set("n", "]b", "<CMD>BufferLineMoveNext<CR>", opts)
end

return M
