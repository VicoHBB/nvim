-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'python', 'markdown', 'racket', 'vim', 'tex', 'lua', 'rust'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

end)

