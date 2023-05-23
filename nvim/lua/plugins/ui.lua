return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            icons = { group = vim.g.icons_enabled and "" or "+", separator = "" },
            disable = { filetypes = { "TelescopePrompt" } },
        },
        config = require('plugins.configs.which-key'),
    },
    {
        "NvChad/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {
            filetypes = { "*", "!lazy" },
            buftype = { "*", "!prompt", "!nofile" },
            user_default_options = {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                names = false, -- "Name" codes like Blue
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                AARRGGBB = false, -- 0xAARRGGBB hex codes
                rgb_fn = true, -- CSS rgb() and rgba() functions
                hsl_fn = true, -- CSS hsl() and hsla() functions
                css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- Available modes: foreground, background
                -- Available modes for `mode`: foreground, background,  virtualtext
                mode = "background", -- Set the display mode.
                virtualtext = "■",
            },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            buftype_exclude = {
                "nofile",
                "terminal",
            },
            filetype_exclude = {
                "help",
                "startify",
                "aerial",
                "alpha",
                "dashboard",
                "lazy",
                "neogitstatus",
                "NvimTree",
                "neo-tree",
                "Trouble",
            },
            context_patterns = {
                "class",
                "return",
                "function",
                "method",
                "^if",
                "^while",
                "jsx_element",
                "^for",
                "^object",
                "^table",
                "block",
                "arguments",
                "if_statement",
                "else_clause",
                "jsx_element",
                "jsx_self_closing_element",
                "try_statement",
                "catch_clause",
                "import_statement",
                "operation_type",
            },
            show_trailing_blankline_indent = false,
            use_treesitter = true,
            char = "▏",
            context_char = "▏",
            show_current_context = true,
            show_current_context_start = true,
            char_highlight_list = {
                "IndentBlanklineIndent",
            },
        },
    },
    {
        "petertriho/nvim-scrollbar",
        event = "BufReadPost",
        config = function()
            local scrollbar = require("scrollbar")
            scrollbar.setup({})
        end,
    },
    {
        'mrjones2014/smart-splits.nvim',
        config = function()
            require('smart-splits').setup({})
        end,
    },
    {
        "mrjones2014/legendary.nvim",
        config = function()
            require('legendary').setup({
                extensions = {
                  smart_splits = {
                    directions = { 'h', 'j', 'k', 'l' },
                    mods = {
                      -- for moving cursor between windows
                      move = '<C>',
                      -- for resizing windows
                      resize = '<M>',
                      -- for swapping window buffers
                      swap = false, -- false disables creating a binding
                    },
                  },
                },
              })
        end,
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require("bufferline").setup{
                options = {
                    mode = 'buffers',
                    diagnostics = "nvim_lsp",
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "File Explorer",
                            text_align = "left",
                            separator = false,
                        }
                    },
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = {'close'}
                    },
                }
            }
        end,
    },
    {
        "goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
        config = function ()
            require("plugins.configs.alpha")
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        config = function ()
            require("plugins.configs.lualine-conf")
        end
    },
    {
        "rcarriga/nvim-notify",
        lazy = false,
        config = function ()
            require("plugins.configs.nvim-notify")
        end
    },
    {
        'stevearc/dressing.nvim',
        opts = {},
        config = function ()
            require("plugins.configs.nvim-dressing")
        end
    },
}
