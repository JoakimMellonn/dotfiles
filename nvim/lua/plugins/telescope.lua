return {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        require("plugins.configs.telescope")
        require("telescope").load_extension("notify")
    end,
}
