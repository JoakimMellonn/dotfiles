require('lualine').setup {
    options = {
        theme = 'dracula',
        disabled_filetypes = {
            statusline = {
                "NvimTree",
                "neo-tree",
            },
            winbar = {},
        },
    },
}
