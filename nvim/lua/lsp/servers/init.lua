local lspSettings = {}
local lspFiletypes = {}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

lspSettings.lua_ls = {
    Lua = {
        runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
            enable = false,
        },
    },
}

lspFiletypes.cssls = {"css", "scss", "less"}

local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
    require('lspconfig')[ls].setup({
        capabilities = capabilities,
        settings = lspSettings[ls],
        filetypes = lspFiletypes[ls],
    })
end

require('ufo').setup()

-- require("lsp.servers.lua_ls")
-- require("lsp.servers.css")
--
-- local lspconfig = require('lspconfig')

-- lspconfig.pyright.setup {}
-- lspconfig.tsserver.setup {}
-- lspconfig.arduino_language_server.setup {}
-- lspconfig.emmet_ls.setup {}
-- lspconfig.yamlls.setup {}
-- lspconfig.marksman.setup {}
-- lspconfig.cssmodules_ls.setup {}
