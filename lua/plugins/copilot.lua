return {
  "zbirenbaum/copilot.lua",
  opts = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-l>",
          next = "<C-j>",
          prev = "<C-k>",
          dismiss = "<C-h>",
        },
      },
      panel = { -- no config options yet
        enabled = true,
      },
    })

    LazyVim.cmp.actions.ai_accept = function()
      if require("copilot.suggestion").is_visible() then
        LazyVim.create_undo()
        require("copilot.suggestion").accept()
        return true
      end
    end
  end,
}
