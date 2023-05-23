-- Basic/other stuff
vim.cmd[[colorscheme dracula]]
vim.opt.clipboard = 'unnamed'

-- Tab stuff and indents
vim.opt.termguicolors = true
vim.opt.list = false
vim.cmd([[highlight IndentBlanklineIndent guifg=#44475a gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#ff79c6 gui=nocombine]])

vim.opt.list = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Scrolling and line numbers
vim.opt.scrolloff = 8
vim.wo.relativenumber = true
