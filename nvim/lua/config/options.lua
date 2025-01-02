-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.scrolloff = 8
opt.shiftwidth = 4
opt.tabstop = 4
opt.wrap = true

-- vim.g stuff
local g = vim.g
g.livepreview_previewer = "open -a Skim"

-- autocmds that is needed at startup
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd("highlight! Normal ctermbg=NONE guibg=NONE")
  end,
})
