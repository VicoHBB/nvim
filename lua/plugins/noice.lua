return {
  -- lazy.nvim
  enabled = true,
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  opts = {
    -- add any options here
    lsp = {
      progress = {
        enabled = true,
        format = {
          { "{spinner} ",              hl_group = "NoiceLspProgressSpinner" },
          { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
        },
        format_done = {
          { "✔ ", hl_group = "NoiceLspProgressSpinner" },
          { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
        },
      },

      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
      hover = {
        enabled = true,
      },
      signature = {
        enabled = true,
        auto_open = {
          enabled  = true,
          trigger  = true, -- Automatically show signature help when typing a trigger character from the LSP
          throttle = 50,   -- Debounce lsp signature help request by 50ms
        },
        view = nil,        -- when nil, use defaults from documentation
        opts = {},         -- merged with defaults from documentation
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = false,        -- use a classic bottom cmdline for search
      command_palette = true,       -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,           -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true,        -- add a border to hover docs and signature help
    },
  },
}
