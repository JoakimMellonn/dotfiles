local utils = require("keymaps.utils")
local wk = require("which-key")
local telescope = require('telescope.builtin')

-- Leader mappings
wk.register({
    -- Neovim
    q = { "<cmd>confirm q<cr>", "Quit NeoVim" },

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
        r = { telescope.resume, "Resume Telescope" },
        c = { telescope.current_buffer_fuzzy_find, "Fuzzy find in buffer" },
    },

    n = {
        name = "Notify",
        h = { function () require("notify").history() end, "Notify history" },
    },

}, { prefix = "<leader>" })

-- Normal mappings
wk.register({
    -- Navigation and Buffers
    ["<C-h>"] = { require('smart-splits').move_cursor_left, "Move to left split" },
    ["<C-l>"] = { require('smart-splits').move_cursor_right, "Move to right split" },
    ["<C-j>"] = { require('smart-splits').move_cursor_down, "Move to below split" },
    ["<C-k>"] = { require('smart-splits').move_cursor_up, "Move to above split" },
    ["<C-Up>"] = { require("smart-splits").resize_up(), "Resize split up" },
    ["<C-Down>"] = { require("smart-splits").resize_down(), "Resize split down" },
    ["<C-Left>"] = { require("smart-splits").resize_left(), "Resize split left" },
    ["<C-Right>"] = { require("smart-splits").resize_right(), "Resize split right" },

    ["<leader>c"] = { utils.close(), "Close tab"},
    ["L"] = { utils.nav(vim.v.count > 0 and vim.v.count or 1), "Move to next buffer" },
    ["H"] = { utils.nav(-(vim.v.count > 0 and vim.v.count or 1)), "Move to previous buffer"},

    -- Best mappings ever
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },
}, { mode = "n" })

