-- Remove spaces in the final of the line after write a file
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
  end,
})

vim.cmd([[
  autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab colorcolumn=80
  autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab colorcolumn=80
  autocmd FileType python setlocal colorcolumn=80
  autocmd FileType verilog_systemverilog setlocal colorcolumn=80
]])
