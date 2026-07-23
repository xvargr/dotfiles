return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        html = {},
        cssls = {},
        ts_ls = {},
        intelephense = {},
        typos_lsp = {},
      },
      autoformat = false,
    },
  },

  {
    "nvim-mini/mini.ai",
    enabled = false,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      indent = { enable = false },
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "php",
        "blade",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
      },
      highlight = { enable = true },
      textObjects = {
        select = {
          keymaps = {
            ["at"] = "@function.outer",
            ["it"] = "@function.inner",
          },
        },
      },
    },
  },

  { "kkoomen/vim-doge" },

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  { "rafamadriz/friendly-snippets", lazy = true },

  {
    "saghen/blink.cmp",
    dependencies = { "L3MON4D3/LuaSnip" },
    opts = {
      completion = {
        menu = {
          auto_show = true,
          border = "rounded",
          -- nvim-cmp style menu
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind", gap = 1 },
            },
          },
        },
        documentation = {
          auto_show = true,
          window = { border = "rounded" },
        },
      },
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      cmdline = {
        keymap = {
          ["<C-j>"] = { "select_next" },
          ["<C-k>"] = { "select_prev" },
          ["<C-l>"] = { "accept" },
        },
      },
      keymap = {
        ["<C-j>"] = { "select_next" },
        ["<C-k>"] = { "select_prev" },
        ["<C-s>"] = { "show_signature", "hide_signature" },
      },
    },
  },

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "lewis6991/async.nvim",
    },
    lazy = false,
  },

  {
    "rmagatti/auto-session",
    lazy = false,
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    },
  },

  {
    "debugloop/telescope-undo.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    keys = {
      { -- lazy style key map
        "<leader>u",
        "<cmd>Telescope undo<cr>",
        desc = "undo history",
      },
    },
    opts = {
      extensions = {
        undo = {
          use_delta = true,
          use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
          side_by_side = false,
          diff_context_lines = vim.o.scrolloff,
          entry_format = "state #$ID, $STAT, $TIME",
        },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("undo")
      require("telescope").load_extension("fzf")
    end,
  },

  {
    "bassamsdata/namu.nvim",
    lazy = false,
    opts = {
      global = {
        movement = {
          next = { "<C-n>", "<C-j>", "<DOWN>" },
          previous = { "<C-p>", "<C-k>", "<UP>" },
        },
      },
      namu_symbols = {
        options = {
          highlight = "NamuColors",
        },
      },
    },
  },

  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "InsertEnter",
  --   opts = {
  --     bind = true,
  --     handler_opts = {
  --       border = "rounded",
  --     },
  --   },
  -- },

  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  { "nvim-tree/nvim-web-devicons", opts = {} },

  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  { "mrjones2014/smart-splits.nvim" },

  { "tpope/vim-fugitive", lazy = false },

  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
  },

  -- { "NMAC427/guess-indent.nvim", lazy = false },
  { "tpope/vim-sleuth", lazy = false },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {},
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },

        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
      })
    end,
  },

  {
    "gbprod/substitute.nvim",
    opts = {
      highlight_substituted_text = {
        enabled = false,
      },
    },
  },

  {
    "kylechui/nvim-surround",
    version = "^4.0.0",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        aliases = {
          ["a"] = ">",
          ["b"] = ")",
          ["B"] = "}",
          ["r"] = "]",
          ["q"] = { '"', "'", "`" },
          ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
        },
      })
    end,
  },

  { "RRethy/vim-illuminate", lazy = false },

  {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
      indent = {
        animate = {
          enabled = false,
        },
      },
      scroll = {
        enabled = false,
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {},
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        section_separators = { left = "", right = "░▒▓" },
        component_separators = "|",
      },
    },
  },

  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({--[[ your config ]]
      })
    end,
  },
}
