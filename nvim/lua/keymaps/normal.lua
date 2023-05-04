local wk = require("which-key")
local telescope = require('telescope.builtin')

-- Leader mappings
wk.register({
    -- Neovim
    q = { "<cmd>q<CR>", "Quit NeoVim" },

    -- NeoTree
    e = { "<cmd>NeoTreeFocusToggle<CR>", "Toggle Explorer" },
    o = {
        function()
            if vim.bo.filetype == "neo-tree" then
                vim.cmd.wincmd "p"
            else
                vim.cmd.Neotree "focus"
            end
        end,
        "Explorer Focus"
    },

    -- Telescope
    f = {
        name = "File", -- optional group name
        f = { telescope.find_files, "Find Files" },
        g = { telescope.live_grep, "Live grep" },
        b = { telescope.buffers, "Buffer" },
        h = { telescope.help_tags, "Help tags" },
    },
}, { prefix = "<leader>" })

-- Normal mappings
wk.register({
    -- Navigation
    ["<C-h>"] = { require('smart-splits').move_cursor_left, "Move to left split" },
    ["<C-l>"] = { require('smart-splits').move_cursor_right, "Move to right split" },
    ["<C-j>"] = { require('smart-splits').move_cursor_down, "Move to below split" },
    ["<C-k>"] = { require('smart-splits').move_cursor_up, "Move to above split" },

    -- Best mappings ever
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },
}, { mode = "n" })