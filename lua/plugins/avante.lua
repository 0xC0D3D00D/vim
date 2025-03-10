local prefix = "<Leader>A"
return {
  "yetone/avante.nvim",
  build = vim.fn.has "win32" == 1 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  event = "User AstroFile", -- load on file open because Avante manages it's own bindings
  cmd = {
    "AvanteAsk",
    "AvanteBuild",
    "AvanteEdit",
    "AvanteRefresh",
    "AvanteSwitchProvider",
    "AvanteChat",
    "AvanteToggle",
    "AvanteClear",
  },
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    { "AstroNvim/astrocore", opts = function(_, opts) opts.mappings.n[prefix] = { desc = " Avante" } end },
  },
  opts = {
    mappings = {
      ask = prefix .. "<CR>",
      edit = prefix .. "e",
      refresh = prefix .. "r",
      focus = prefix .. "f",
      toggle = {
        default = prefix .. "t",
        debug = prefix .. "d",
        hint = prefix .. "h",
        suggestion = prefix .. "s",
        repomap = prefix .. "R",
      },
      diff = {
        next = "]c",
        prev = "[c",
      },
      files = {
        add_current = prefix .. ".",
      },
    },
  },
  specs = { -- configure optional plugins
    { "AstroNvim/astroui", opts = { icons = { Avante = "" } } },
    { -- if copilot.lua is available, default to copilot provider
      "zbirenbaum/copilot.lua",
      optional = true,
      specs = {
        {
          "yetone/avante.nvim",
          opts = {
            provider = "claude-sonnet-3.7",
            vendors = {
              ["claude-sonnet-3.7"] = { 
                __inherited_from = "openai",
                api_key_name = "OPENROUTER_API_KEY",
                endpoint = "https://openrouter.ai/api/v1",
                model = "anthropic/claude-3.7-sonnet",
                max_tokens = 131072,
                disable_tools = true,
              },
              ["gemini-2.0-flash"] = {
                __inherited_from = "openai",
                api_key_name = "OPENROUTER_API_KEY",
                endpoint = "https://openrouter.ai/api/v1",
                model = "google/gemini-2.0-flash-001",
                max_tokens = 8192,
                disable_tools = true,
              },
              ["gpt-4.5-preview"] = {
                __inherited_from = "openai",
                api_key_name = "OPENROUTER_API_KEY",
                endpoint = "https://openrouter.ai/api/v1",
                model = "openai/gpt-4.5-preview",
                max_tokens = 16384,
                disable_tools = true,
              },
              ["grok-2-1212"] = {
                __inherited_from = "openai",
                api_key_name = "OPENROUTER_API_KEY",
                endpoint = "https://openrouter.ai/api/v1",
                model = "openai/gpt-4.5-preview",
                max_tokens = 131072,
                disable_tools = true,
              },
            },
            auto_suggestions_provider = "gemini-2.0-flash",
          },
        },
      },
    },
    {
      -- make sure `Avante` is added as a filetype
      "MeanderingProgrammer/render-markdown.nvim",
      optional = true,
      opts = function(_, opts)
        if not opts.file_types then opts.file_types = { "markdown" } end
        opts.file_types = require("astrocore").list_insert_unique(opts.file_types, { "Avante" })
      end,
    },
    {
      -- make sure `Avante` is added as a filetype
      "OXY2DEV/markview.nvim",
      optional = true,
      opts = function(_, opts)
        if not opts.filetypes then opts.filetypes = { "markdown", "quarto", "rmd" } end
        opts.filetypes = require("astrocore").list_insert_unique(opts.filetypes, { "Avante" })
      end,
    },
  },
}
