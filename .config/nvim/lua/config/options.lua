vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.o.winborder = "rounded"

vim.g.autoformat = false
vim.g.editorconfig = false

vim.g.phpactor_enabled = false
vim.lsp.handlers["$/progress"] = function() end -- disable annoying lsp progress notification

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
