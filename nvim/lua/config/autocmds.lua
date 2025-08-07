-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function should_format()
  if vim.g.autoformat == false then
    return false
  end

  local cwd = vim.fn.getcwd()
  if vim.bo.filetype == "json" and cwd:match("/home/joped/repo/ntnx") then
    return false
  end
  if cwd:match("/home/joped/repo/atlassian") then
    return false
  end
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.g.autoformat = should_format()
  end,
})
