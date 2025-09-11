vim.cmd([[map <C-a> ggVG]])

vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })

vim.keymap.set({ "n", "v" }, "c", '"_c', { desc = "Change without yanking" })
vim.keymap.set({ "n", "v" }, "C", '"_C', { desc = "Change without yanking" })
vim.keymap.set({ "n", "v" }, "d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set({ "n", "v" }, "D", '"_D', { desc = "Delete without yanking" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.keymap.set("n", "<leader>i", function()
      vim.lsp.buf.code_action()
    end, { buffer = buf, desc = "Code Actions (includes imports)" })
  end,
})
