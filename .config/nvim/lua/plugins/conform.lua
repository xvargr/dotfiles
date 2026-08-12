return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        css = { "prettier" },
        html = { "prettier" },
        javascript = { "prettierd", "prettier" },
        php = { "pretty-php" },
        blade = { "blade-formatter" },
        markdown = { "prettier" },
        python = { "ruff_fix", "ruff_format" },
      },
      -- format_on_save = false,
    },
  },
}
