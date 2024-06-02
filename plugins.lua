local overrides = require("custom.configs.overrides")
local SECRETS = require("custom.secrets")
---@type NvPluginSpec[]
local plugins = {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = function()
          local mason = require("mason")
          local mason_lspconfig = require("mason-lspconfig")
          
          mason.setup()
          mason_lspconfig.setup {
            ensure_installed = overrides.mason.ensure_installed,
          }
          
          mason_lspconfig.setup_handlers {
            function(server_name)
              require("lspconfig")[server_name].setup {
                on_attach = require("plugins.configs.lspconfig").on_attach,
                capabilities = require("plugins.configs.lspconfig").capabilities,
              }
            end,
          }
        end,
      },
      {
        "williamboman/mason-lspconfig.nvim",
      },
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require("custom.configs.swift")
      require("custom.configs.typescript")
      require("custom.configs.rust")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    'simrat39/rust-tools.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap'
    },
    config = function()
      require('rust-tools').setup({})
    end
  },
  {
    "pmizio/typescript-tools.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("typescript-tools").setup({})
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup()
    end,
    ft = { "html", "javascriptreact", "typescriptreact" },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    lazy = false,
    enabled = true,
  },
  {
    "wakatime/vim-wakatime",
    lazy = false,
    enabled = true,
    config = function ()
      vim.g.wakatime_PromptOnRegister = 0
      vim.g.wakatime_api_key = SECRETS.WAKATIME_SECRET_API_KEY
    end,
  },
  {
    "wojciech-kulik/xcodebuild.nvim",
    lazy=false,
    enabled=true,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-tree.lua",
      "stevearc/oil.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function ()
      require("xcodebuild").setup({})
    end,
  }
}

return plugins
