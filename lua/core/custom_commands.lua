-- Globals
local cmd = vim.api.nvim_create_user_command

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

return M
