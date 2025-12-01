local commands = require('core.custom_commands')
local autocmd = vim.api.nvim_create_autocmd
local keyset = vim.keymap.set
Initial_Dir = vim.fn.getcwd()

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
        "marker-groups"
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

-- Show CWD
autocmd({ "DirChanged" }, {
    callback = function()
        vim.cmd('pwd')
    end,
})

autocmd("User", {
    pattern = "MiniFilesActionRename",
    callback = function(event)
        Snacks.rename.on_rename_file(event.data.from, event.data.to)
    end,
})


autocmd("User", {
  pattern = "OilActionsPost",
  callback = function(event)
      if event.data.actions[1].type == "move" then
          Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
      end
  end,
})

autocmd("VimEnter", {
    once = true,
    callback = function()
        Initial_Dir = vim.fn.getcwd()
    end,
})

-- Ignore quickfix as buffer
vim.cmd([[
  augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
  augroup END
]])

-- @TODO: Check if this steel need it
-- To support org files
vim.cmd [[
  autocmd BufRead,BufNewFile *.org set filetype=org
]]
