local wk = require("which-key")
local telescope = require('telescope.builtin')
local sessions = require("session_manager")

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        if opts.remap and not vim.g.vscode then
            opts.remap = nil
        end
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

local function has(plugin)
    return require("lazy.core.config").plugins[plugin] ~= nil
end

-- save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Best maps ever
map("n", "<C-d>", "<C-d>zz")
map("n","<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", require('smart-splits').move_cursor_left, { desc = "Go to left window", remap = true })
map("n", "<C-l>", require('smart-splits').move_cursor_right, { desc = "Go to lower window", remap = true })
map("n", "<C-j>", require('smart-splits').move_cursor_down, { desc = "Go to upper window", remap = true })
map("n", "<C-k>", require('smart-splits').move_cursor_up, { desc = "Go to right window", remap = true })

-- Move Lines
-- TODO: need to figure out modifier keys...
-- map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
if has("bufferline.nvim") then
    map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
    map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
    map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
    map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
    map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
    map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
    map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
    map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
map("n", "<leader>cc", "<cmd>bprevious<cr><cmd>bd #<cr>", { desc = "Close buffer" })


-- WhichKey mappings

-- Leader mappings
wk.register({
    -- Neovim
    q = { "<cmd>confirm qa<cr>", "Quit NeoVim" },
    w = { "<cmd>w<cr><esc>", "Write to file" },

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

    s = {
        name = "Sessions",
        f = { sessions.load_session, "Load session" },
        l = { sessions.load_last_session, "Last session" },
        s = { sessions.save_current_session, "Save session" },
    },

    F = {
        name = "Flutter",
        r = { "<cmd>FlutterRun<CR>", "Flutter Run" },
        q = { "<cmd>FlutterQuit<CR>", "Flutter Quit" },
        e = { "<cmd>FlutterEmulators<CR>", "Flutter Emulators" },
        R = { "<cmd>FlutterReload<CR>", "Flutter Reload" },
        d = { "<cmd>FlutterDevices<CR>", "Flutter Devices" },
    },

}, { prefix = "<leader>" })

