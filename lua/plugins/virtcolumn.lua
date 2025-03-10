return {
  "xiyaowong/virtcolumn.nvim",
  enabled = true,
  config = function()
    vim.g.virtcolumn_char = '▕' -- char to display the line
    vim.g.virtcolumn_priority = 10 -- priority of extmark
  end
}
