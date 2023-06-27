require("lsp.servers.lua_ls")
require("lsp.servers.css")

local lspconfig = require('lspconfig')

lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.arduino_language_server.setup {}
lspconfig.emmet_ls.setup {}
lspconfig.yamlls.setup {}
lspconfig.marksman.setup {}
lspconfig.cssmodules_ls.setup {}
