-- Globals
local cmd = vim.api.nvim_create_user_command
local Terminal  = require('toggleterm.terminal').Terminal

local M = {} -- Var for return

-- Auto completion function
local function auto_completion(options)
  return function(arg)
    return vim.tbl_filter(function(s)
      return string.match(s, '^' .. arg)
    end, options)
  end
end

-- Create a command and set its availability
function M.ltexedit()
  cmd('LTeXEdit', function(opts)
    local home = vim.fn.expand('~')
    local file

    local options = {
      ["dictionary"] = home .. "/.ltex/dictionaries/dictionary.json",
      ["disabled_rules"] = home .. "/.ltex/dictionaries/disabled_rules.json",
      ["false_positives"] = home .. "/.ltex/dictionaries/false_positives.json"
    }

    file = options[opts.args]

    if file then
      -- Open the file in a new buffer
      vim.cmd('e ' .. file)
      print(opts.args .. " Opened")
    else
      print("Invalid option: " .. opts.args)
    end
  end, {
    nargs = 1, -- Expect exactly one argument
    complete = auto_completion({ "dictionary", "disabled_rules", "false_positives" }),
    desc = "Edit LTeX rules"
  })
end

function M.overseer_last_task()
  cmd("OverseerRestartLast", function()
    local overseer = require("overseer")
    local tasks = overseer.list_tasks({ recent_first = true })
    if vim.tbl_isempty(tasks) then
      vim.notify("No tasks found", vim.log.levels.WARN)
    else
      overseer.run_action(tasks[1], "restart")
    end
  end, {
    nargs = 0,
    desc = "Restart last task"
  })
end

-- REPL for lua & python
-- @TODO: Use Toggleterm api
function M.start_repl()
  cmd("REPL", function()
    local ft = vim.bo.filetype
    local cmd

    if 'lua' == ft then
      -- cmd = "lua"
      cmd = "croissant"
    elseif 'python' == ft then
      cmd = "ipython --no-autoindent"
    else
      print("Dunno")
    end

    local repl = Terminal:new({
      name = "REPL",
      cmd = cmd,
    })

    repl:toggle()

  end, {
    nargs = 0,
    desc = "Start REPL"
  })
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
