-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- disable default surround keybinds
vim.g.nvim_surround_no_mappings = true

vim.filetype.add({
  pattern = {
    [".*compose%.?.*%.yaml"] = "yaml.docker-compose",
  },
})
