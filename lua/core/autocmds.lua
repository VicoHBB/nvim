-- Remove spaces in the final of the line after write a file
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
  end,
})

vim.cmd([[
  augroup matchup_matchparen_highlight
    autocmd!
    autocmd ColorScheme * hi MatchParen guifg=red
  augroup END
]])
