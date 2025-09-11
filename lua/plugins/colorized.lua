return {
  "norcalli/nvim-colorizer.lua",
  event = "BufReadPost",
  config = function()
    require("colorizer").setup({
      "*", -- Ativa para todos os tipos de arquivos
      css = { rgb_fn = true }, -- Ativa funções como rgb() e rgba() para arquivos CSS
      html = { names = true }, -- Suporta nomes de cores como "red" em HTML
    }, {
      mode = "background", -- Exibe a cor no fundo; altere para "foreground" se preferir
    })
  end,
}
