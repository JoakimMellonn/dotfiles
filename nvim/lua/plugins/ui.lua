return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            icons = { group = vim.g.icons_enabled and "" or "+", separator = "" },
            disable = { filetypes = { "TelescopePrompt" } },
            ignore_missing = true,
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
                "[",
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
                highlights = {
                    buffer_selected = {
                        bold = true,
                        italic = false,
                    },
                },
                options = {
                    diagnostics = "nvim_lsp",
                    indicator_icon = "▎",
                    tab_size = 23,
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "EXPLORER",
                            text_align = "center",
                            -- separator = true,
                        },
                    },
                    separator_style = "slant",
                    hover = {
                        enabled = true,
                        delay = 0,
                        reveal = { "close" },
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
        lazy = true,
        opts = {
            input = {
                border = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█" }, -- [ top top top - right - bottom bottom bottom - left ]
                win_options = { winblend = 0 },
            },
            -- select = { telescope = require("tvl.util").telescope_theme("dropdown") },
        },
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
            cmdline = {
                view = "cmdline",
                format = {
                    cmdline = { icon = "  " },
                    search_down = { icon = "  󰄼" },
                    search_up = { icon = "  " },
                    lua = {icon = " "}
                },
            },
            lsp = {
                progress = { enabled = true },
                hover = { enabled = false },
                signature = { enabled = false },
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        kind = "",
                        find = "written",
                    },
                    opts = { skip = true },
                },
            },
        },
    },
    {
        "anuvyklack/windows.nvim",
        event = "WinNew",
        dependencies = {
            { "anuvyklack/middleclass" },
            { "anuvyklack/animation.nvim", enabled = true },
        },
        opts = {
            animation = { enable = true, duration = 150, fps = 60 },
            autowidth = { enable = true },
        },
        keys = { { "<leader>m", "<cmd>WindowsMaximize<CR>", desc = "Zoom window" } },
        init = function()
            vim.o.winwidth = 30
            vim.o.winminwidth = 30
            vim.o.equalalways = true
        end,
    },
    {
        "utilyre/barbecue.nvim",
        event = { "BufReadPost" },
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            theme = "auto",
            include_buftypes = { "" },
            exclude_filetypes = { "gitcommit", "Trouble", "toggleterm" },
            show_modified = false,
            kinds = {
                File = "", -- File
                Module = "", -- Module
                Namespace = "", -- Namespace
                Package = "", -- Package
                Class = "", -- Class
                Method = "", -- Method
                Property = "", -- Property
                Field = "", -- Field
                Constructor = "", -- Constructor
                Enum = "", -- Enum
                Interface = "", -- Interface
                Function = "", -- Function
                Variable = "", -- Variable
                Constant = "", -- Constant
                String = "", -- String
                Number = "", -- Number
                Boolean = "◩", -- Boolean
                Array = "", -- Array
                Object = "", -- Object
                Key = "", -- Key
                Null = "ﳠ", -- Null
                EnumMember = "", -- EnumMember
                Struct = "", -- Struct
                Event = "", -- Event
                Operator = "", -- Operator
                TypeParameter = "", -- TypeParameter
                Macro = "", -- Macro
            },
        },
    },
    {
        "onsails/lspkind.nvim",
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
        },
    }
}
