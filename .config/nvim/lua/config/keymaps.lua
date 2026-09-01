-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local del = vim.keymap.del
local set = vim.keymap.set

-- Telescope
-- local builtin = require "telescope.builtin"
-- map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
-- map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
-- map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
-- map('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' })

-- remove LazyVim grep (cwd)
del("n", "<leader>sG")
map("n", "fw", function()
  require("lazyvim.util").pick("grep", {})()
end, { desc = "Grep (cwd)" })

-- namu symbol search
map("n", "<leader>fs", ":Namu symbols<cr>", { desc = "Jump to LSP symbol", silent = true })
map("n", "<leader>fss", ":Namu workspace<cr>", { desc = "LSP Symbols - Workspace", silent = true })

-- Smart splits (tmux)
-- resizing splits
-- map("n", "<C-A-h>", require("smart-splits").resize_left)
-- map("n", "<C-A-j>", require("smart-splits").resize_down)
-- map("n", "<C-A-k>", require("smart-splits").resize_up)
-- map("n", "<C-A-l>", require("smart-splits").resize_right)
-- moving between splits
-- map("n", "<C-h>", require("smart-splits").move_cursor_left)
-- map("n", "<C-j>", require("smart-splits").move_cursor_down)
-- map("n", "<C-k>", require("smart-splits").move_cursor_up)
-- map("n", "<C-l>", require("smart-splits").move_cursor_right)
-- map("n", "<C-\\>", require("smart-splits").move_cursor_previous)
-- swapping buffers between windows
-- map("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
-- map("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
-- map("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
-- map("n", "<leader><leader>l", require("smart-splits").swap_buf_right)

-- Substitution
del("n", "s")
del("x", "s")
map("n", "s", require("substitute").operator, { desc = "Substitute", noremap = true })
map("n", "ss", require("substitute").line, { desc = "Substitute line", noremap = true })
map("n", "S", require("substitute").eol, { desc = "Substitute eol", noremap = true })
map("x", "s", require("substitute").visual, { desc = "Substitute", noremap = true })

-- Surround
set("n", "sr", "<Plug>(nvim-surround-normal)", {
  desc = "Add a surrounding pair around a motion (normal mode)",
})
set("n", "srr", "<Plug>(nvim-surround-normal-cur)", {
  desc = "Add a surrounding pair around the current line (normal mode)",
})
set("x", "sr", "<Plug>(nvim-surround-visual)", {
  desc = "Add a surrounding pair around a visual selection",
})
set("n", "dsr", "<Plug>(nvim-surround-delete)", {
  desc = "Delete a surrounding pair",
})
set("n", "csr", "<Plug>(nvim-surround-change)", {
  desc = "Change a surrounding pair",
})
set("n", "csr", "<Plug>(nvim-surround-change-line)", {
  desc = "Change a surrounding pair, putting replacements on new lines",
})

-- DOGE Generate comment for current line
set("n", "<Leader>dg", "<Plug>(doge-generate)")
set("n", "<TAB>", "<Plug>(doge-comment-jump-forward)")
set("n", "<S-TAB>", "<Plug>(doge-comment-jump-backward)")
set("i", "<TAB>", "<Plug>(doge-comment-jump-forward)")
set("i", "<S-TAB>", "<Plug>(doge-comment-jump-backward)")
set("x", "<TAB>", "<Plug>(doge-comment-jump-forward)")
set("x", "<S-TAB>", "<Plug>(doge-comment-jump-backward)")

-- refactor
set({ "n", "x" }, "<leader>rf", function()
  -- this keymap doesn't select any textobject by default, so you may need to provide one each time you use it.
  require("refactoring").select_refactor()
end, { desc = "Select refactor" })

-- Close buffer without closing split
-- map("n", "<leader>q", ":enew | bd #<CR>", { noremap = true, silent = true, desc = "Close buffer" })

-- map("n", "<leader>o", "<cmd>Oil --float<CR>", { desc = "Open Oil File Explorer" })
map("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Open Oil File Explorer" })

-- treeSJ
set("n", "<leader>j", require("treesj").toggle, { desc = "Split TS block" })
set("n", "<leader>J", function()
  require("treesj").toggle({ split = { recursive = true } })
end, { desc = "Split TS block recursively" })

set("n", "<leader>j", require("treesj").toggle, { desc = "Split TS block" })
set("n", "<leader>J", function()
  require("treesj").toggle({ split = { recursive = true } })
end, { desc = "Split TS block recursively" })

vim.keymap.set("n", "<leader>O", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "Copy file path to clipboard" })
