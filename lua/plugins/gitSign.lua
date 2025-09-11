return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      current_line_blame = true, -- Mostra a informação de blame na linha atual
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- Exibe no final da linha
        delay = 100, -- Tempo de delay para exibir o blame
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    })
  end,
}
