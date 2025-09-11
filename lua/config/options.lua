vim.opt.tabstop = 4 -- Número de espaços que uma tabulação representa
vim.opt.shiftwidth = 4 -- Número de espaços usados para cada nível de indentação
vim.opt.expandtab = true -- Converte tabs em espaços

vim.opt.relativenumber = false
vim.opt.number = true
vim.g.lazyvim_picker = "fzf"

vim.cmd([[
  set conceallevel=0
  set concealcursor=""
]])

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client and client.name == "omnisharp" then
      -- Garantir que completion resolve imports automaticamente
      client.server_capabilities.completionProvider.resolveProvider = true
    end
  end,
})

vim.diagnostic.config({
  virtual_text = {
    source = "always", -- Exibe a origem da mensagem
    prefix = "❌", -- Prefixo visível para erros
  },
  severity_sort = true, -- Ordena diagnósticos por severidade
  float = {
    source = "always",
  },
})
