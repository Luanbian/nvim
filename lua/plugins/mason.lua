return {
  -- Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "typescript-language-server",
        "prettier",
        "rustfmt",
        "stylua",
        "js-debug-adapter",
        "omnisharp",
        "csharpier",
        "netcoredbg",
        "editorconfig-checker",
      },
    },
  },
  -- IMPORTANTE: Desabilitar completamente o rust_analyzer no lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Explicitamente desabilitar rust_analyzer
        rust_analyzer = false,
        ts_ls = {},
        omnisharp = {
          cmd = { vim.fn.stdpath("data") .. "/mason/packages/omnisharp/OmniSharp" },
          settings = {
            -- Configurações mínimas para auto-import funcionar
            RoslynExtensionsOptions = {
              EnableImportCompletion = true,
            },
            enableImportCompletion = true,
            organizeImportsOnFormat = true,
          },
          -- Capabilities mínimas para code actions (necessário para auto-import)
          capabilities = (function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.resolveSupport = {
              properties = { "additionalTextEdits" },
            }
            return capabilities
          end)(),
        },
      },
      setup = {
        rust_analyzer = function()
          return true
        end,
        omnisharp = function(_, opts)
          require("lspconfig").omnisharp.setup(opts)
          return true
        end,
      },
    },
  },
  -- Configuração específica do mason-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "rust_analyzer",
        "ts_ls",
        "omnisharp",
      },
      automatic_installation = true,
      handlers = {
        function(server_name)
          if server_name ~= "rust_analyzer" and server_name ~= "omnisharp" then
            require("lspconfig")[server_name].setup({})
          end
        end,
        rust_analyzer = function() end,
        omnisharp = function() end,
      },
    },
  },
}
