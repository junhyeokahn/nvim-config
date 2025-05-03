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
        auto_trigger_ft = { "python", "cpp", "c" },
      },
      provider = "openai_compatible",
      request_timeout = 2,
      provider_options = {
        openai_compatible = {
          api_key = "OPENROUTER_API_KEY",
          end_point = "https://openrouter.ai/api/v1/chat/completions",
          model = "mistralai/codestral-2501",
          name = "Openrouter",
          optional = {
            max_tokens = 56,
            top_p = 0.9,
            provider = {
              sort = "throughput",
            },
          },
        },
      },
    }
    local vt_action = require("minuet.virtualtext").action

    vim.keymap.set("i", "<Tab>", function()
      if vt_action.is_visible() then
        vt_action.accept()
        return ""
      end
      return vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
    end, { expr = true, silent = true })
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
}
