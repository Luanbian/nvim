return {
  {
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" } -- Mostrar tag correspondente se estiver fora da tela
      vim.g.matchup_matchparen_enabled = 0
    end,
  },
}
