vim.keymap.set('n', '<leader>q', ':quit<CR>', { noremap = true })

vim.keymap.set('n', '<C-Right>', '<c-w>l', { silent = true })
vim.keymap.set('n', '<C-Left>', '<c-w>h', { silent = true })
vim.keymap.set('n', '<C-Up>', '<c-w>k', { silent = true })
vim.keymap.set('n', '<C-Down>', '<c-w>j', { silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
