-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Fix PHP indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    vim.bo.autoindent = true
    vim.bo.smartindent = true
    vim.bo.indentexpr = ""
    vim.bo.indentkeys = ""
  end,
})

local oil_buffer_cleaner = vim.api.nvim_create_augroup("OilBufferCleaner", { clear = true })

-- Track open buffers BEFORE saving oil changes
local buffers_before_save = {}

vim.api.nvim_create_autocmd("User", {
  desc = "Track buffers before Oil writes changes",
  pattern = "OilActionsPre",
  group = oil_buffer_cleaner,
  callback = function()
    buffers_before_save = {}
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_valid(bufnr) then
        buffers_before_save[bufnr] = true
      end
    end
  end,
})

-- Wipe out newly opened background buffers AFTER oil saves
vim.api.nvim_create_autocmd("User", {
  desc = "Wipe out hidden buffers opened by Oil LSP operations",
  pattern = "OilActionsPost",
  group = oil_buffer_cleaner,
  callback = function()
    -- Small delay to let LSP operations complete and Oil finish its routine
    vim.defer_fn(function()
      for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_valid(bufnr) and not buffers_before_save[bufnr] then
          -- Only wipe if it's not currently visible in any window
          if vim.fn.bufwinnr(bufnr) == -1 then
            vim.api.nvim_buf_delete(bufnr, { force = true })
          end
        end
      end
      -- Reset tracking table
      buffers_before_save = {}
    end, 100) -- 100ms delay is usually safe for LSP hooks
  end,
})
