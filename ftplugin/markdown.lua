local keyset = vim.keymap.set

-- Set local leader
-- vim.g.maplocalleader = "\\"

vim.bo.tabstop     = 2
vim.bo.softtabstop = 2
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 2
vim.wo.colorcolumn = "100"

vim.cmd [[highlight Headline guibg=#3C3836]]
vim.cmd [[highlight CodeBlock guibg=#282828]]
vim.cmd [[highlight Dash guibg=#3C3836]]
vim.cmd [[highlight Quote guibg=#282828]]

-- Keymaps
keyset(
  'n',
  '<F9>',
  '<CMD>MarkdownPreviewToggle<CR>',
  {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Toggle Preview"
  }
)

keyset(
  'n',
  '\\x',
  '<CMD>MDTaskToggle<CR>',
  {
    buffer = 0,
    noremap = true,
    silent= true,
    desc = "Toggle Checkbox"
  }
)

keyset(
  'n',
  '\\o',
  '<CMD>MDListItemBelow<CR>',
  {
    buffer = 0,
    noremap = true,
    silent= true,
    desc = "Add list item below"
  }
)

keyset(
  'n',
  '\\O',
  '<CMD>MDListItemAbove<CR>',
  {
    buffer = 0,
    noremap = true,
    silent= true,
    desc = "Add list item below"
  }
)

-- keyset( 'n', "||",
--   function ()
--     -- vim.cmd("normal vip")
--     print("Need to check")
--   end,
--   {
--     buffer = 0,
--     noremap = true,
--     silent= true,
--     desc = "Align Table(Need to check)"
--   }
-- )

keyset(
  'n',
  "\\t",
  "0100lbi<CR><ESC>0",
  {
    buffer = 0,
    noremap = true,
    silent= true,
    desc = "Limit text to 100 columns"
  }
)
