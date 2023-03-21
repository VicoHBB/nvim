-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

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

  --use {
    --'kosayoda/nvim-lightbulb',
    --requires = 'antoinemadec/FixCursorHold.nvim',
    --config = function()
      --require('nvim-lightbulb').setup({
        --autocmd = {enabled = true}
      --})
    --end,
  --}
  --use {
    --'w0rp/ale',
    --ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'python', 'markdown', 'racket', 'vim', 'tex', 'lua', 'rust', ''},
    --cmd = 'ALEEnable',
    --config = 'vim.cmd[[ALEEnable]]'
  --}
  
end)


