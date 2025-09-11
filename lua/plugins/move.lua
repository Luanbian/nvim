return {
  "matze/vim-move",
  config = function()
    -- Mapeamento para mover a linha de texto
    vim.api.nvim_set_keymap("n", "<A-k>", ":move .-2<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<A-j>", ":move .+1<CR>", { noremap = true, silent = true })

    -- Configuração adicional (se necessário)
    vim.g.move_key_modifier = "alt" -- Usa a tecla ALT como modificador
  end,
}
