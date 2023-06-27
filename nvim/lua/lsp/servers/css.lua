local lspconfig = require("lspconfig")

lspconfig.cssls.setup {
    filetypes = {"css", "scss", "less"},
}
