local commands = require('core.custom_commands')
local autocmd = vim.api.nvim_create_autocmd
local keyset = vim.keymap.set

-- Remove spaces in the final of the line after write a file
autocmd({ "BufWritePre" }, {
    callback = function()
        vim.cmd([[%s/\s\+$//e]])
    end,
})

-- close some filetypes with <q>
autocmd("FileType", {
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
        keyset("n", "q", "<cmd>close<cr>",
            {
                buffer = event.buf,
                silent = true
            })
    end,
})

-- close Diffviews
autocmd("FileType", {
    pattern = {
        "DiffviewFiles",
        "DiffviewFileHistory",
    },
    callback = function()
        keyset("n", "q", function()
                require("diffview").close()
            end,
            {
                silent = true
            }
        )
    end,
})

autocmd("FileType", {
    pattern = "help",
    command = "wincmd H", -- Mueve la ventana de ayuda a la derecha
})

-- Set MiniPairs for "$" in TeX equations
autocmd("FileType", {
    pattern = { 'tex', 'markdown', 'org' },
    callback = function()
        MiniPairs.map_buf(0, 'i', '$', { action = 'closeopen', pair = '$$' })
    end
})

-- Define autocommands to enable the command for specific file types
-- add_cmd('FileType', {
--   pattern = { 'txt', 'markdown', 'org', 'tex' },
--   callback = commands.ltexedit
-- })

-- Clean CMake Cache
autocmd('FileType', {
    pattern = { 'c', 'cpp', 'cmake' },
    callback = commands.clear_cmake_cache
})

-- @TODO: Review workflow with this
autocmd('FileType', {
    pattern = { 'verilog', 'systemverilog' },
    callback = function()
        vim.cmd('VerilogErrorFormat Verilator 1')
    end,
    once = true,
})

-- REPL
autocmd("FileType", {
    -- @TODO: Find the way to executen when run "nvim file.py/file.lua"
    pattern = { "lua", "python" },
    callback = commands.set_repl
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
