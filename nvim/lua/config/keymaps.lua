-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.api.nvim_del_keymap("n", "<C-w>>")
-- vim.api.nvim_del_keymap("n", "<C-w><")
vim.keymap.set("n", "<leader>tv", ":toggleterm direction=vertical<cr>", { desc = "open terminal in vertical split" })
vim.keymap.set("n", "<C-.>", "<cmd>vertical resize +10<cr>", { desc = "expand window horizontally" })
vim.keymap.set("n", "<C-w>-", "<cmd>resize -20<cr>", { desc = "shrink window horizontally" })
vim.keymap.set("n", "<C-w>=", "<cmd>resize +20<cr>", { desc = "increase window height" })
vim.keymap.set("n", "<C-w>,", "<cmd>vertical resize -20<cr>", { desc = "increase window width" })
vim.keymap.set("n", "<C-w>.", "<cmd>vertical resize +20<cr>", { desc = "increase window width" })
