-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function in_ntnx_auto()
  local cwd = vim.fn.getcwd()
  return cwd:match("/home/joped/repo/ntnx")
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "json" and in_ntnx_auto() then
      vim.g.autoformat = false
      return
    end
    vim.g.autoformat = true
  end,
})
