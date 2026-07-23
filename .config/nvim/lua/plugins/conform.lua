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
      },
      -- format_on_save = false,
    },
  },
}

-- local options = {
--   formatters_by_ft = {
--     lua = { "stylua" },
--     css = { "prettier" },
--     html = { "prettier" },
--     javascript = { "prettierd", "prettier" },
--     php = { "pretty-php" },
--     blade = { "blade-formatter" },
--     markdown = { "prettier" },
--   },
--
--   -- format_on_save = {
--   --   -- These options will be passed to conform.format()
--   --   timeout_ms = 500,
--   --   lsp_fallback = true,
--   -- },
--   format_on_save = false,
-- }
--
-- return options
