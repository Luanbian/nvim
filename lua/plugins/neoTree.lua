return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "right",
      width = 45,
      -- remove título laranja e bordas chamativas
      popup = false,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
        ["v"] = "open_vsplit",
        ["s"] = "open_split",
        ["q"] = "close_window",
      },
    },

    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "ﰊ",
        highlight = "NeoTreeFileIcon",
      },
      modified = {
        symbol = "●",
        highlight = "NeoTreeModified",
      },
      git_status = {
        symbols = {
          added = "✚",
          modified = "",
          deleted = "✖",
          renamed = "➜",
          untracked = "★",
          ignored = "◌",
          unstaged = "✗",
          staged = "✓",
          conflict = "",
        },
      },
    },

    filesystem = {
      follow_current_file = {
        enabled = true,
      },
      use_libuv_file_watcher = true,
      filtered_items = {
        hide_dotfiles = false, -- mostra arquivos ocultos (.env)
        hide_gitignored = false,
        never_show = { ".DS_Store", "thumbs.db" },
        hide_by_name = {}, -- pode colocar node_modules aqui se quiser esconder
      },
    },

    buffers = {
      follow_current_file = {
        enabled = true,
      },
      group_empty_dirs = true,
    },
  },

  config = function(_, opts)
    require("neo-tree").setup(opts)

    -- destaca suavemente o fundo do Neo-tree para ficar estilo mini.files
    vim.cmd([[
      highlight NeoTreeNormal guibg=NONE
      highlight NeoTreeCursorLine guibg=Grey20
      highlight NeoTreeExpander guifg=Grey50
      highlight NeoTreeFileIcon guifg=Grey80
      highlight NeoTreeModified guifg=Yellow
    ]])
  end,
}
