return {
  {
    "ibhagwan/fzf-lua",
    lazy = false,
    config = function()
      require("fzf-lua").setup({
        fzf_opts = {
          ["--layout"] = "reverse",
          ["--info"] = "inline",
        },
        files = {
          fd_opts = "--color=never --type f --hidden --exclude .git --exclude node_modules",
          find_opts = "-type f -not -path '*/node_modules/*' -not -path '*/.git/*'",
        },
        grep = {
          rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden --glob '!node_modules/**' --glob '!.git/**'",
        },
        file_ignore_patterns = { "node_modules", ".git" },
        git = {
          files = {
            cmd = "git ls-files --exclude-standard",
          },
        },
      })
    end,
  },
}
