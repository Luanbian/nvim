return {
  -- nvim-cmp - Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saecki/crates.nvim", -- Para Cargo.toml
    },
    opts = function(_, opts)
      -- Adicionar source do crates para arquivos Cargo.toml
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = "crates" })

      return opts
    end,
  },
}
