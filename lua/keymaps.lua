vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>e", ":e %:h", { desc = "[E]dit the directory of the current file" })
vim.api.nvim_set_keymap(
  "n",
  "#",
  [[:let @/='\<'.expand('<cword>').'\>'<CR>:set hlsearch<CR>]],
  { noremap = true, silent = true }
)
