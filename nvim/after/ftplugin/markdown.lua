-- apply once
local function apply()
  vim.opt_local.conceallevel = 1 -- hide markup aggressively
  vim.opt_local.concealcursor = "nc" -- conceal in Normal/Command; reveal in Insert/Visual
end

apply()

-- some plugins reset options on window/buffer events; re-assert when entering
local grp = vim.api.nvim_create_augroup("FixMarkdownConceal", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = grp,
  buffer = 0, -- only this buffer
  callback = apply,
})
