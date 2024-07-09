return {
  { "dracula/vim", name = "dracula" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["o"] = "open",
        },
      },
    },
  },
  -- {
  --   "goolord/alpha-nvim",
  --   opts = function()
  --     local dashboard = require("alpha.themes.dashboard")
  --     local logo = [[
  --   █████╗ ██╗  ██╗███████╗██╗  ██╗██╗   ██╗ █████╗ ██╗     ██╗  ██╗   ██╗
  --  ██╔══██╗██║ ██╔╝██╔════╝██║  ██║██║   ██║██╔══██╗██║     ██║  ╚██╗ ██╔╝
  --  ███████║█████╔╝ ███████╗███████║██║   ██║███████║██║     ██║   ╚████╔╝
  --  ██╔══██║██╔═██╗ ╚════██║██╔══██║██║   ██║██╔══██║██║     ██║    ╚██╔╝
  --  ██║  ██║██║  ██╗███████║██║  ██║╚██████╔╝██║  ██║███████╗███████╗██║
  --  ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝
  --  I use Neovim btw
  --        ]]
  --
  --     dashboard.section.header.val = vim.split(logo, "\n")
  --   end,
  -- },
  {
    "nvim-treesitter/nvim-treesitter-context",
  },
}
