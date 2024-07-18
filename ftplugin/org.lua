-- [[Orgmode]]
local keyset = vim.keymap.set
local cmp = require('cmp')                    -- Set up nvim-cmp

vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'

vim.bo.tabstop     = 2
vim.bo.softtabstop = 2
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 2

-- vim.cmd [[highlight Headline guibg=#3C3836]]
-- vim.cmd [[highlight CodeBlock guibg=#282828]]
-- vim.cmd [[highlight Dash guibg=#3C3836]]
-- vim.cmd [[highlight Quote guibg=#282828]]
--
-- Config Sources for cmp
--
-- Keymaps
-- keyset(
--   'n',
--   '<leader>r',
--   "<CMD>Telescope orgmode refile_heading<CR>",
--   {silent= true}
-- )
-- keyset(
--   'n',
--   '<leader>os',
--   "<CMD>Telescope orgmode search_headings<CR>",
--   {silent= true}
-- )
-- keyset(
--   'n',
--   "\\ta",
--   "<CMD>TableModeToggle<CR>",
--   {silent= true}
-- )
