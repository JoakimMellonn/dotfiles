return {
    { "max397574/better-escape.nvim", event = "InsertCharPre", opts = { timeout = 300 } },
    -- { "famiu/bufdelete.nvim", cmd = { "Bdelete", "Bwipeout" } },
    {
        "NMAC427/guess-indent.nvim",
        event = "User AstroFile",
        config = require "plugins.configs.guess-indent"
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    {
        "shatur/neovim-session-manager",
        config = function ()
            require("plugins.configs.session")
        end
    },
    {
        "ggandor/leap.nvim",
    }
}
