-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Auto-format Makefile: convert leading spaces to tabs on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "Makefile",
  callback = function()
    -- Convert leading 4 spaces to a tab
    vim.cmd([[%s/^\s\+/\=repeat("\t", len(submatch(0))/&expandtab?&shiftwidth:1)/]])
  end,
})

-- Ensure Makefiles always use real tabs
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.opt_local.expandtab = false -- Use tabs, not spaces
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 0
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "json", "yaml" },
  callback = function()
    vim.opt_local.conceallevel = 1
  end,
})
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd([[
      highlight Normal guibg=none
      highlight NonText guibg=none
      highlight NormalNC guibg=none
      highlight SignColumn guibg=none
      highlight VertSplit guibg=none
      highlight EndOfBuffer guibg=none
    ]])
  end,
})
