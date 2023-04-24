-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
vim.g.virtcolumn_char = '▕' -- char to display the line
vim.g.virtcolumn_priority = 10 -- priority of extmark

return require('packer').startup( function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'eandrju/cellular-automaton.nvim'
  use {
    'gorbit99/codewindow.nvim',
    config = function()
      local codewindow = require('codewindow')
      codewindow.setup()
      codewindow.apply_default_keybinds()
    end,
  }
  use {
    "nvim-zh/colorful-winsep.nvim",
    config = function ()
      require('colorful-winsep').setup({
        -- highlight for Window separator
        highlight = {
          fg = "#B8BB26",
          --bg = "#282828",
          --bg = "#16161E",
          --fg = "#1F3442",
        },
        -- timer refresh rate
        interval = 30,
        -- This plugin will not be activated for filetype in the following table.
        --no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
        -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
        symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
      })
    end
  }

  --- to probe
  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  }

  use { 'xiyaowong/virtcolumn.nvim' }

  -- use {
  --   "luukvbaal/statuscol.nvim",
  -- }

  -- use {"ecthelionvi/NeoColumn.nvim",
  --   config = function ()
  --     require("NeoColumn").setup({
  --       fg_color = '',
  --       bg_color = '',
  --       NeoColumn = '80',
  --       excluded_ft = {},
  --       always_on = true,
  --     })
  --   end
  -- }
  --
  --

end)


