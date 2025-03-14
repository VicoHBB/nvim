-- Variables
local cmd = vim.api.nvim_create_user_command
local buf_cmd = vim.api.nvim_buf_create_user_command

local M = {} -- Var for return

-- Auto completion function
-- local function auto_completion(options)
--   return function(arg)
--     return vim.tbl_filter(function(s)
--       return string.match(s, '^' .. arg)
--     end, options)
--   end
-- end

-- Create a command and set its availability
-- function M.ltexedit()
--   cmd('LTeXEdit', function(opts)
--     local home = vim.fn.expand('~')
--     local file
--
--     local options = {
--       ["dictionary"] = home .. "/.ltex/dictionaries/dictionary.json",
--       ["disabled_rules"] = home .. "/.ltex/dictionaries/disabled_rules.json",
--       ["false_positives"] = home .. "/.ltex/dictionaries/false_positives.json"
--     }
--
--     file = options[opts.args]
--
--     if file then
--       -- Open the file in a new buffer
--       vim.cmd('e ' .. file)
--       print(opts.args .. " Opened")
--     else
--       print("Invalid option: " .. opts.args)
--     end
--   end, {
--     nargs = 1, -- Expect exactly one argument
--     complete = auto_completion({ "dictionary", "disabled_rules", "false_positives" }),
--     desc = "Edit LTeX rules"
--   })
-- end

-- REPL for lua & python
-- @TODO: Use Toggleterm api
function M.set_repl()
    local ft = vim.bo.filetype

    if 'lua' == ft or 'python' == ft then
        buf_cmd(0, "REPL", function()
                local Terminal = require('toggleterm.terminal').Terminal
                local interpreter

                if 'lua' == ft then
                    -- cmd = "lua"
                    interpreter = "croissant"
                elseif 'python' == ft then
                    interpreter = "ipython --no-autoindent"
                else
                    print("Dunno")
                end

                local repl = Terminal:new({
                    name = "REPL",
                    cmd = interpreter,
                })

                repl:toggle()
            end,
            {
                nargs = 0,
                desc = "Start REPL"
            }
        )
    end
end

function M.clear_cmake_cache()
    cmd("PurgeCMake", function()
        local home = vim.fn.expand('~')
        local cmake_cache_dir = home .. "/.cache/cmake_tools_nvim"

        -- Check if directory exists
        if vim.fn.isdirectory(cmake_cache_dir) > 0 then
            -- Delete directory
            vim.fn.delete(cmake_cache_dir, "rf")
            print("CMake cache purged")
        else
            print("CMake cache directory not found")
            print(cmake_cache_dir)
        end
    end, {
        nargs = 0,
        desc = "Clear CMake Cache"
    })
end

return M
