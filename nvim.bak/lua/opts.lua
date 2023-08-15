-- Basic/other stuff
vim.opt.clipboard = "unnamed"
-- vim.wo.foldmethod = "manual"
vim.opt.termguicolors = true

-- Tab stuff and indents
vim.opt.list = false
vim.cmd([[highlight IndentBlanklineIndent guifg=#44475a gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#ff79c6 gui=nocombine]])
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

-- Folding and stuff
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
