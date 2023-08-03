return {
    {
        "neovim/nvim-lspconfig",
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = {
            {
                "jay-babu/mason-null-ls.nvim",
                cmd = { "NullLsInstall", "NullLsUninstall" },
                opts = { handlers = {} },
            },
        },
    },
    {
        "dundalek/lazy-lsp.nvim",
        dependencies = {
            { "neovim/nvim-lspconfig" },
        },
    },
}
