return {

  -- HOP
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
  },

  -- fast formatter
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
    lazy = false,
  },

  {
    "echasnovski/mini.surround",
    version = false,
    lazy = false,
    opts = {
      mappings = {
        add = "sa", -- Add surrounding
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`
      },
    },
  },

  -- Markown rendering (also in avante.nvim so commented this one)
  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   opts = {},
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  --   lazy = false,
  -- },

  -- leet code
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      -- {
      --   "rcarriga/nvim-notify",
      --   opts = {
      --     background_colour = "#000001",
      --   },
      -- },
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      lang = "python3",

      -- configuration goes here
    },
    lazy = false,
  },

  -- show diagnostics
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>cx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>cX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>cL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>cQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  -- Zen mode / centering code
  -- no neck pain / zen mode / center
  {
    "shortcuts/no-neck-pain.nvim",
    lazy = false,
  },

  -- {
  --   "folke/zen-mode.nvim",
  --   lazy = false,
  -- },

  -- save session depending on the directory
  {
    "rmagatti/auto-session",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim", -- Only needed if you want to use session lens
    },

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { "~/", "~/Downloads", "/" },
      -- log_level = 'debug',
    },
  },

  -- undo tree
  {
    "mbbill/undotree",
    lazy = false,
  },

  -- Copilot
  {
    "github/copilot.vim",
    lazy = false,
  },

  -- Lsp manager
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
        "go",
        "c_sharp",
        "cpp",
        "c",
      },
      highlight = {
        enable = true,
      },
      auto_install = true,
    },
    lazy = false,
  },

  -- LSP configuration
  {
    "jose-elias-alvarez/null-ls.nvim",
    -- ft = { "python" }, -- only load on these filetypes
    opts = function()
      return require "configs.null-ls"
    end,
    lazy = false,
  },

  -- lsp, linting, formatting, completion and debugging installer
  {
    "williamboman/mason.nvim",
    opts = {
      -- ensure_installed = {
      -- "pyright",
      -- "black",
      -- "mypy",
      -- "ruff",
      -- "clang-format",
      -- "clangd",
      -- "stylua",
      -- "prettier",
      -- "gopls",
      -- "goimports",
      -- "csharpier",
      -- "csharp-language-server", -- Uncomment if you decide to use this
      -- },
    },
  },

  -- Avante nvim (AI chat, etc.)
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "copilot",
      -- add any opts here
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
