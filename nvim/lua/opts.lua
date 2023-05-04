vim.cmd[[colorscheme dracula]]

-- Tab stuff and indents
vim.cmd [[highlight IndentBlanklineIndent guifg=#44475a gui=nocombine]]

vim.opt.list = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Scrolling and line numbers
vim.opt.scrolloff = 8
vim.wo.relativenumber = true
