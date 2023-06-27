-- Basic/other stuff
vim.opt.clipboard = "unnamed"
vim.wo.foldmethod = "manual"
vim.opt.termguicolors = true

-- Tab stuff and indents
vim.opt.list = false
vim.cmd([[highlight IndentBlanklineIndent guifg=#44475a gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#8be9fd gui=nocombine]])
vim.cmd([[highlight IndentBlanklineSpaceChar guifg=#44475a gui=nocombine]])

vim.opt.list = true
vim.opt.expandtab = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.api.nvim_create_autocmd("Filetype", {
    callback = function ()
        vim.opt.tabstop = 4
        vim.opt.softtabstop = 4
        vim.opt.shiftwidth = 4
    end
})

vim.api.nvim_create_autocmd("Filetype", {
    pattern = { "dart", "tsx", "ts", "jsx", "js" },
    callback = function ()
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
        vim.opt.shiftwidth = 2
    end
})

-- Scrolling and line numbers
vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.relativenumber = true
