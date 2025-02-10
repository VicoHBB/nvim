local commands = require('core.custom_commands')
local add_cmd = vim.api.nvim_create_autocmd
local keyset = vim.keymap.set

-- Remove spaces in the final of the line after write a file
add_cmd({ "BufWritePre" }, {
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
  end,
})

-- close some filetypes with <q>
add_cmd("FileType", {
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
    vim.keymap.set("n", "q", "<cmd>close<cr>",
    {
      buffer = event.buf,
      silent = true
    })
  end,
})

add_cmd("FileType", {
  pattern = "help",
  command = "wincmd H",  -- Mueve la ventana de ayuda a la derecha
})

-- Set MiniPairs for "$" in TeX equations
add_cmd("FileType", {
  pattern = { 'tex', 'markdown', 'org' },
  callback = function ()
    MiniPairs.map_buf(0, 'i', '$', { action = 'closeopen', pair = '$$' })
  end
})

-- Define autocommands to enable the command for specific file types
add_cmd('FileType', {
  pattern = { 'txt', 'markdown', 'org', 'tex' },
  callback = function()
    commands.ltexedit()
  end
})

-- Set "/*" for comments
add_cmd("FileType", {
  pattern = { 'c', 'cpp', 'verilog', 'systemverilog' },
  callback = function()
    local opts = { noremap = true, buffer = true, silent = true }
    keyset("i", "/*",     "/* */<Left><Left><Left>",        opts)
    keyset("i", "/*<CR>","/*<CR>*<CR>*/<Esc>kA<Space>", opts)
  end
})

-- Clean CMake Cache
add_cmd('FileType', {
  pattern = { 'c', 'cpp', 'cmake'},
  callback = function()
    commands.clear_cmake_cache()
  end
})

-- OverseerRestartLast
add_cmd('FileType', {
  pattern = '*', -- Apply to all file types
  callback = function()
    commands.overseer_last_task()
  end,
})


-- REPL
add_cmd('FileType', {
  pattern = { 'lua', 'python' },
  callback = function()
    commands.start_repl()
  end
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

