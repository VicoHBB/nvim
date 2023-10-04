local keyset = vim.keymap.set

vim.bo.tabstop     = 2
vim.bo.softtabstop = 2
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 2

keyset(
  'n',
  "<leader>mv",
  ":MarkdownPreview<CR>",
  {silent= true}
)
keyset(
  'n',
  "<leader>ms",
  ":MarkdownPreviewStop<CR>",
  {silent= true}
)
