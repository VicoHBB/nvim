local keyset = vim.keymap.set

vim.bo.tabstop     = 2
vim.bo.softtabstop = 2
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 2

vim.cmd [[highlight Headline guibg=#3C3836]]
vim.cmd [[highlight CodeBlock guibg=#282828]]
vim.cmd [[highlight Dash guibg=#3C3836]]
vim.cmd [[highlight Quote guibg=#282828]]
