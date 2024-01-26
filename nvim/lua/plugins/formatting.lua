return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = vim.list_extend(opts.sources or {}, {
      nls.builtins.formatting.stylua.with({
        extra_args = {
          "--tab-width",
          4,
        },
      }),
      nls.builtins.formatting.clang_format.with({
        extra_args = {
          "--tab-width",
          4,
        },
      }),
    })
  end,
}
