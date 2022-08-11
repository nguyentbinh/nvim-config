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
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      opt = true,
      event = "BufReadPre",
      run = ":TSUpdate",
      config = function()
        require("init.nvim-treesitter").setup()
      end,
      requires = {
        { "nvim-treesitter/nvim-treesitter-textobjects", event = "BufReadPre" },
        { "RRethy/nvim-treesitter-textsubjects", event = "BufReadPre" },
        {
          "nvim-treesitter/nvim-treesitter-context",
          event = "BufReadPre",
          config = function()
            require("init.nvim-treesitter-context").setup()
          end,
        },
      },
    }

    -- Completion
    use {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      opt = true,
      config = function()
        require("init.cmp").setup()
      end,
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-copilot",
        { "lukas-reineke/cmp-rg", tag = "v1.3.*" },
        "onsails/lspkind.nvim",
      }
    }

    -- LSP
    use {
      "neovim/nvim-lspconfig",
      tag = "v0.1.*",
      opt = true,
      event = { "BufReadPre" },
      wants = {
        "mason.nvim",
        "mason-lspconfig.nvim",
        "mason-tool-installer.nvim",
        "cmp-nvim-lsp",
        "lua-dev.nvim",
        "schemastore.nvim",
        "typescript.nvim",
      },
      config = function()
        require("init.lsp").setup()
      end,
      requires = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "folke/lua-dev.nvim",
        "b0o/schemastore.nvim",
        "jose-elias-alvarez/typescript.nvim",
      },
    }

    -- NvimTree
    use {
      "kyazdani42/nvim-tree.lua",
      wants = "nvim-web-devicons",
      cmd = { "NvimTreeToggle", "NvimTreeClose" },
      -- module = "nvim-tree",
      config = function()
        require("init.nvim-tree").setup()
      end,
    }

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.*",
      opt = true,
      config = function()
        require("init.telescope").setup()
      end,
      cmd = { "Telescope" },
      module = { "telescope", "telescope.builtin" },
      keys = { "<leader>f" },
      wants = {
        "plenary.nvim",
        "telescope-fzf-native.nvim",
      },
      requires = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      },
    }

    -- Auto pairs
    use {
      "windwp/nvim-autopairs",
      opt = true,
      event = "InsertEnter",
      wants = "nvim-treesitter",
      module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
      config = function()
        require("init.nvim-autopairs").setup()
      end,
    }

    -- IndentLine
    use {
      "lukas-reineke/indent-blankline.nvim",
      tag = "v2.*",
      config = function()
        require("init.indent-blankline").setup()
      end,
    }

    -- whichkey
    use {
      "folke/which-key.nvim",
      event = "VimEnter",
      config = function()
        require("init.whichkey").setup()
      end,
    }

    -- Status Line
    use {
      "nvim-lualine/lualine.nvim",
      event = "BufReadPre",
      after = "nvim-treesitter",
      config = function()
        require("init.lualine").setup()
      end,
      wants = "nvim-web-devicons",
    }

    -- Buffer Line
    use {
      "akinsho/nvim-bufferline.lua",
      tag = "v2.*",
      event = "BufReadPre",
      wants = "nvim-web-devicons",
      config = function()
        require("init.bufferline").setup()
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
    use { "onsails/lspkind.nvim" }


    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require'packer'
  packer.init(conf)
  packer.startup(plugins)
end

return M
