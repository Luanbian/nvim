return {
  "nvimtools/none-ls.nvim",
  event = "LazyFile",
  dependencies = { "mason.nvim", "nvimtools/none-ls-extras.nvim" },
  init = function()
    LazyVim.on_very_lazy(function()
      -- register the formatter with LazyVim
      LazyVim.format.register({
        name = "none-ls.nvim",
        priority = 200, -- set higher than conform, the builtin formatter
        primary = true,
        format = function(buf)
          return LazyVim.lsp.format({
            bufnr = buf,
            filter = function(client)
              return client.name == "null-ls"
            end,
          })
        end,
        sources = function(buf)
          local ret = require("null-ls.sources").get_available(vim.bo[buf].filetype, "NULL_LS_FORMATTING") or {}
          return vim.tbl_map(function(source)
            return source.name
          end, ret)
        end,
      })
    end)
  end,
  opts = function(_, opts)
    local null_ls = require("null-ls")
    local eslint = require("none-ls.diagnostics.eslint")
    opts.root_dir = opts.root_dir
      or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
    opts.sources = vim.list_extend(opts.sources or {}, {
      null_ls.builtins.formatting.prettier.with({
        extra_args = { "--config-precedence", "prefer-file" },
      }),
      eslint.with({
        command = "eslint_d", -- Usa `eslint_d` para linting rápido
        diagnostics_format = "[eslint] #{m}\n(#{c})",
        condition = function(utils)
          return utils.root_has_file(".eslintrc.js") or utils.root_has_file(".eslintrc.json")
        end,
      }),
    })
  end,
}
