-- Remove spaces in the final of the line after write a file
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.cmd([[
  augroup matchup_matchparen_highlight
    autocmd!
    autocmd ColorScheme * hi MatchParen guifg=red
  augroup END
]])

-- Ignore quickfix as buffer
vim.cmd([[
  augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
  augroup END
]])

