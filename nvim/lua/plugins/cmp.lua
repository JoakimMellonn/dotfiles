return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-emoji",
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    opts.mapping["<CR>"] = nil
    opts.mapping["<C-e>"] = require("cmp").mapping.abort()
  end,
}
