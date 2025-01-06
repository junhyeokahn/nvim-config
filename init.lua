require "options"
require "keymaps"
require "snippets"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "tpope/vim-sleuth" },
  { "numToStr/Comment.nvim", opts = {} },
  require "plugins.gitsigns",
  require "plugins.vim-visual-multi",
  require "plugins.fzf-lua",
  require "plugins.nvim-lspconfig",
  require "plugins.conform",
  require "plugins.nvim-cmp",
  require "plugins.catppuccin",
  require "plugins.todo-comments",
  require "plugins.mini",
  require "plugins.nvim-treesitter",
  require "plugins.autopairs",
  require "plugins.neoscroll",
  require "plugins.flash",
  require "plugins.oil",
  require "plugins.harpoon",
  -- require "plugins.avante",
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})
