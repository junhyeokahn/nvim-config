return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  config = function()
    local fzf = require "fzf-lua"

    vim.keymap.set("n", "<leader>sh", fzf.help_tags, { desc = "Help" })
    vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "Keymaps" })
    vim.keymap.set("n", "<leader>sf", fzf.files, { desc = "Files" })
    vim.keymap.set("n", "<leader>sw", fzf.grep_cword, { desc = "Current word" })
    vim.keymap.set("n", "<leader>sg", fzf.live_grep_glob, { desc = "Live grep with --glob" })
    vim.keymap.set("n", "<leader>sb", fzf.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>sn", function()
      fzf.files { cwd = vim.fn.stdpath "config" }
    end, { desc = "Search Neovim files" })
    vim.keymap.set("n", "<leader>s/", fzf.lines, { desc = "Buffer lines" })
    vim.keymap.set("n", "<leader>st", fzf.treesitter, { desc = "Treesitter symbol" })
    vim.keymap.set("n", "<leader>sq", fzf.quickfix, { desc = "Quick fix" })
    vim.keymap.set("n", "<leader>gs", fzf.git_status, { desc = "Git status" })

    require("fzf-lua").setup {
      files = {
        git_icons = false,
      },
      actions = {
        files = {
          true,
          ["ctrl-q"] = {
            fn = fzf.actions.file_edit_or_qf,
            prefix = "select-all+",
          },
        },
      },
    }
  end,
}
