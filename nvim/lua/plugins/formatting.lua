return {
  "nvimtools/none-ls.nvim",
  opts = function()
    local nls = require("null-ls")

    nls.builtins.formatting.clang_format.with({
      extra_args = { "--tab-width", "4" },
    })
    nls.builtins.formatting.stylua.with({
      extra_args = { "--tab-width", "4" },
    })
    nls.builtins.formatting.biome.with({
      extra_args = { "--tab-width", "4" },
    })
    nls.builtins.formatting.gofumpt.with({
      extra_args = { "--tab-width", "4" },
    })
    nls.builtins.formatting.goimports.with({
      extra_args = { "--tab-width", "4" },
    })
    nls.builtins.formatting.markdownlint.with({
      extra_args = { "--tab-width", "4" },
    })
    nls.builtins.formatting.shfmt.with({
      extra_args = { "--tab-width", "4" },
    })
  end,
}
