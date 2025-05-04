return {
  { import = "plugins.fzf-lua" },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    opts = {
      -- model = "claude-3.7-sonnet",
      mappings = {
        accept_diff = {
          normal = "<C-y>",
          insert = "<C-y>",
        },
      },
    },
    config = function(_, opts)
      local chat = require "CopilotChat"
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)
      opts.question_header = "  " .. user .. " "
      opts.answer_header = "  Copilot "

      chat.setup(opts)

      local select = require "CopilotChat.select"
      vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
        chat.ask(args.args, { selection = select.visual })
      end, { nargs = "*", range = true })

      vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
        chat.ask(args.args, { selection = select.buffer })
      end, { nargs = "*", range = true })
    end,
    event = "VeryLazy",
    keys = {
      {
        "<leader>av",
        ":CopilotChatVisual",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ai",
        function()
          local input = vim.fn.input "Ask Copilot: "
          if input ~= "" then
            vim.cmd("CopilotChat " .. input)
          end
        end,
        desc = "CopilotChat - Ask input",
      },
      {
        "<leader>aq",
        function()
          local input = vim.fn.input "Quick Chat: "
          if input ~= "" then
            vim.cmd("CopilotChatBuffer " .. input)
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      { "<leader>al", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" },
      { "<leader>av", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
      { "<leader>a?", "<cmd>CopilotChatModels<cr>", desc = "CopilotChat - Select Models" },
      { "<leader>aa", "<cmd>CopilotChatAgents<cr>", desc = "CopilotChat - Select Agents" },
    },
  },
}
