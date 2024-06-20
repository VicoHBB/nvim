local keyset = vim.keymap.set

-- Set local leader
-- vim.g.maplocalleader = "\\"

vim.bo.tabstop     = 2
vim.bo.softtabstop = 2
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 2

vim.cmd [[highlight Headline guibg=#3C3836]]
vim.cmd [[highlight CodeBlock guibg=#282828]]
vim.cmd [[highlight Dash guibg=#3C3836]]
vim.cmd [[highlight Quote guibg=#282828]]

-- Keymaps
keyset(
  'n',
  '\\x',
  '<CMD>MDTaskToggle<CR>',
  {
    silent= true,
    desc = "Toggle Checkbox"
  }
)

keyset(
  'n',
  '\\o',
  '<CMD>MDListItemBelow<CR>',
  {
    silent= true,
    desc = "Add list item below"
  }
)

keyset(
  'n',
  '\\O',
  '<CMD>MDListItemAbove<CR>',
  {
    silent= true,
    desc = "Add list item below"
  }
)

keyset(
  'n',
  "\\ta",
  "<CMD>TableModeToggle<CR>",
  {silent= true}
)
