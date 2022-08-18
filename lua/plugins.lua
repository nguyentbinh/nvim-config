local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "single" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end

    local packer_grp = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
    vim.api.nvim_create_autocmd(
      { "BufWritePost" },
      { pattern = "init.lua", command = "source <afile> | PackerCompile", group = packer_grp }
    )
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    use { 'nathom/filetype.nvim' }

    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-lua/popup.nvim' }

    -- LSP
    use {
      "neovim/nvim-lspconfig",
      tag = "v0.1.*",
      event = { "BufReadPre" },
      wants = {
        "mason.nvim",
        "mason-lspconfig.nvim",
        "mason-tool-installer.nvim",
        "cmp-nvim-lsp",
        "null-ls.nvim",
        "lua-dev.nvim",
        "schemastore.nvim",
        "typescript.nvim",
      },
      config = function()
        require("config.lsp").setup()
      end,
      requires = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "jose-elias-alvarez/null-ls.nvim",
        "folke/lua-dev.nvim",
        "b0o/schemastore.nvim",
        "jose-elias-alvarez/typescript.nvim",
      },
    }

    -- Completion
    use {
      "hrsh7th/nvim-cmp",
      opt = true,
      event = "InsertEnter",
      config = function()
        require("config.cmp").setup()
      end,
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        -- "hrsh7th/cmp-copilot",
        "onsails/lspkind.nvim",
      },
    }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      opt = true,
      event = "BufReadPre",
      run = ":TSUpdate",
      config = function()
        require("config.nvim-treesitter").setup()
      end,
      requires = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "RRethy/nvim-treesitter-textsubjects",
        {
          "nvim-treesitter/nvim-treesitter-context",
          event = "BufReadPre",
          config = function()
            require("config.nvim-treesitter-context").setup()
          end,
        },
      },
    }

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.*",
      cmd = { "Telescope" },
      module = { "telescope", "telescope.builtin" },
      keys = { "<leader>f", "<leader>l" },
      wants = {
        "plenary.nvim",
        "popup.nvim",
        "telescope-fzf-native.nvim",
      },
      config = function()
        require("config.telescope").setup()
      end,
      requires = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      },
    }

    -- Git
    use {
      "tpope/vim-fugitive",
      tag = "v3.*",
      opt = true,
      cmd = { "Git", "Gvdiffsplit" },
    }
    use {
      "sindrets/diffview.nvim",
      cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
      config = function()
        require("config.diffview").setup()
      end,
      requires = "nvim-lua/plenary.nvim",
    }
    use {
      "lewis6991/gitsigns.nvim",
      event = "BufReadPre",
      wants = "plenary.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("config.gitsigns").setup()
      end,
    }

    -- Notification
    use {
      "rcarriga/nvim-notify",
      event = "BufReadPre",
      config = function()
        require("config.nvim-notify").setup()
      end,
    }

    -- Terminal
    use {
      "akinsho/toggleterm.nvim",
      tag = "v2.*",
      keys = { [[<C-\>]] },
      cmd = { "ToggleTerm", "TermExec" },
      module = { "toggleterm", "toggleterm.terminal" },
      config = function()
        require("config.toggleterm").setup()
      end,
    }

    -- Comment
    use {
      "numToStr/Comment.nvim",
      tag = "v0.6.*",
      keys = { "gc", "gcc", "gbc" },
      config = function()
        require("config.comment").setup()
      end,
    }

    -- Auto pair
    use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      wants = "nvim-treesitter",
      module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
      config = function()
        require("config.nvim-autopairs").setup()
      end,
    }

    -- Surround
    use {
      "kylechui/nvim-surround",
      event = "BufReadPost",
      config = function()
        require("config.nvim-surround").setup()
      end,
    }

    -- Colorizer
    use {
      "norcalli/nvim-colorizer.lua",
      cmd = "ColorizerToggle",
      config = function()
        require("config.nvim-colorizer").setup()
      end,
    }

    -- Indent Line
    use {
      "lukas-reineke/indent-blankline.nvim",
      -- event = "BufReadPre",
      config = function()
        require("config.indent-blankline").setup()
      end,
    }

    -- Nvim Tree
    use {
      "kyazdani42/nvim-tree.lua",
      wants = "nvim-web-devicons",
      cmd = { "NvimTreeToggle", "NvimTreeClose" },
      config = function()
        require("config.nvim-tree").setup()
      end,
    }

    -- whichkey
    use {
      "folke/which-key.nvim",
      event = "VimEnter",
      config = function()
        require("config.whichkey").setup()
      end,
    }

    -- Input/Select UI
    use {
      "stevearc/dressing.nvim",
      event = "BufReadPre",
      config = function()
        require("config.dressing").setup()
      end,
    }

    -- Status Line
    use {
      "nvim-lualine/lualine.nvim",
      event = "BufReadPre",
      after = "nvim-treesitter",
      config = function()
        require("config.lualine").setup()
      end,
      wants = "nvim-web-devicons",
    }

    -- Buffer Line
    use {
      "akinsho/nvim-bufferline.lua",
      event = "BufReadPre",
      wants = "nvim-web-devicons",
      config = function()
        require("config.bufferline").setup()
      end,
    }

    -- Colorscheme
    use {
      "EdenEast/nightfox.nvim",
      config = function()
        vim.cmd "colorscheme nightfox"
      end,
    }

    -- Icon
    use {
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }
    use {
      "onsails/lspkind.nvim",
      module = "lspkind"
    }

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
