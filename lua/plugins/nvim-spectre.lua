return {
  "nvim-pack/nvim-spectre",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  config = true,
  keys = {
    { "<leader>sr", "<cmd>lua require('spectre').open()<cr>", desc = "[S]earch and [R]place" },
  },
}
