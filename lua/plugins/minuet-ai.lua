return {
  "milanglacier/minuet-ai.nvim",
  config = function()
    require("minuet").setup {
      cmp = {
        enable_auto_complete = false,
      },
      blink = {
        enable_auto_complete = false,
      },
      virtualtext = {
        auto_trigger_ft = { "python", "lua", "c", "cpp", "markdown" },
        keymap = {
          accept = "<A-a>",
          accept_line = "<A-A>",
          prev = "<A-[>",
          next = "<A-]>",
          dismiss = "<A-e>",
        },
      },
      provider = "claude",
      provider_options = {
        claude = {
          model = "claude-3-5-haiku-20241022",
          stream = true,
          api_key = "ANTHROPIC_API_KEY",
          max_tokens = 56,
          request_timeout = 2,
          optional = {
            stop_sequences = nil,
          },
        },
      },
    }
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
}
