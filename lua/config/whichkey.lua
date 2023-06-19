local M = {}

local whichkey = require'which-key'

local conf = {
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
  },
}
whichkey.setup(conf)

local opts = {
  mode = "n", -- Normal mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local function normal_keymap()
  local keymap = {
    b = {
      name = "Buffer",
      c = { "<CMD>bdelete %<CR>", "Close Buffer" },
      f = { "<CMD>bdelete! %<CR>", "Force Close Buffer" },
      D = { "<CMD>%bwipeout<CR>", "Delete All Buffers" },
      b = { "<CMD>BufferLinePick<CR>", "Pick a Buffer" },
      p = { "<CMD>BufferLinePickClose<CR>", "Pick & Close a Buffer" },
    },

    d = {
      name = "Diff",
      b = { "<CMD>Git blame<CR>", "Blame" },
      g = { "<CMD>Gvdiffsplit<CR>", "Three-way Diff" },
      o = { "<CMD>DiffviewOpen<CR>", "Open Diff" },
      c = { "<CMD>DiffviewClose<CR>", "Close Diff" },
      h = { "<CMD>DiffviewFileHistory<CR>", "History" },
      f = { "<CMD>DiffviewFileHistory %<CR>", "File History" },
    },

    f = {
      name = "Find",
      f = { "<CMD>Telescope find_files<CR>", "Files" },
      l = { "<CMD>Telescope live_grep<CR>", "Live Grep" },
      g = { "<CMD>Telescope grep_string<CR>", "Grep String" },
      c = { "<CMD>Telescope commands<CR>", "Commands" },
      r = { "<CMD>Telescope lsp_references<CR>", "References" },
    },
  }

  whichkey.register(keymap, opts)
end

function M.setup()
  normal_keymap()
end

return M
