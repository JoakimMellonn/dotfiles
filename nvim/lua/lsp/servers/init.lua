require("lsp.servers.lua_ls")

local lspconfig = require('lspconfig')

lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.cssls.setup {}
lspconfig.arduino_language_server.setup {}
lspconfig.emmet_ls.setup {}
lspconfig.yamlls.setup {}
lspconfig.marksman.setup {}
