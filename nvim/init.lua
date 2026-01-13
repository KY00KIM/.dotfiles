-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("config.lazy")
vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight NormalNC guibg=none
  highlight SignColumn guibg=none
  highlight VertSplit guibg=none
  highlight EndOfBuffer guibg=none
]])
