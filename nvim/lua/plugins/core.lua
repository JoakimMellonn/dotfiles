return {
    { "max397574/better-escape.nvim", event = "InsertCharPre", opts = { timeout = 300 } },
    { "NMAC427/guess-indent.nvim", event = "User AstroFile", config = require "plugins.configs.guess-indent" },
}