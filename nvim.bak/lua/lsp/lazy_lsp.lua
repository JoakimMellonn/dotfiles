local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

require("lazy-lsp").setup {
    -- By default all available servers are set up. Exclude unwanted or misbehaving servers.
    excluded_servers = {
        "sqls",
        "eslint",
        "denols",
        "rome"
    },
    -- Alternatively specify preferred servers for a filetype (others will be ignored).
    preferred_servers = {
    },
    -- Default config passed to all servers to specify on_attach callback and other options.
    default_config = {
        -- flags = {
        --     debounce_text_changes = 150,
        -- },
        -- on_attach = on_attach,
        capabilities = capabilities,
    },
    configs = {
        lua_ls = require("lsp.servers.lua_ls"),
        cssls = require("lsp.servers.css")
    },
}
