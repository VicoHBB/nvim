local M = {}

---@param increment boolean
---@param g? boolean
function M.dial(increment, g)
  local mode = vim.fn.mode(true)
  -- Use visual commands for VISUAL 'v', VISUAL LINE 'V' and VISUAL BLOCK '\22'
  local is_visual = mode == "v" or mode == "V" or mode == "\22"
  local func = (increment and "inc" or "dec") ..
      (g and "_g" or "_") ..
      (is_visual and "visual" or "normal")
  local group = vim.g.dials_by_ft[vim.bo.filetype] or "default"
  return require("dial.map")[func](group)
end

return {
  "monaqa/dial.nvim",
  enabled = true,
  opts    = function()
    local augend = require('dial.augend')

    local logical_alias = augend.constant.new({
      elements = { "&&", "||" },
      word = false,
      cyclic = true
    })

    local logical_words = augend.constant.new({
      elements = { "and", "or" },
      word = false,
      cyclic = true
    })

    local capitalized_boolean = augend.constant.new({
      elements = {
        "True",
        "False"
      },
      word = false,
      cyclic = true
    })

    local logical_states = augend.constant.new({
      elements = {
        "HIGH",
        "LOW"
      },
      word = false,
      cyclic = true
    })

    local control_states = augend.constant.new({
      elements = {
        "ENABLE",
        "DISABLE"
      },
      word = false,
      cyclic = true
    })

    return {
      dials_by_ft = {},
      groups = {
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.decimal_int,
          augend.integer.alias.hex,
          augend.integer.alias.binary,
          augend.date.alias["%Y-%m-%d"],
          augend.date.alias["%Y/%m/%d"],
          augend.date.alias["%H:%M"],
          -- 2025-03-07
          -- Custom
          capitalized_boolean,
          augend.constant.alias.bool,
          logical_alias,
          logical_words,
          logical_states,
          control_states
        },
      }
    }
  end,
  config  = function(_, opts)
    -- copy defaults to each group
    for name, group in pairs(opts.groups) do
      if name ~= "default" then
        vim.list_extend(group, opts.groups.default)
      end
    end
    require('dial.config').augends:register_group(opts.groups)
    vim.g.dials_by_ft = opts.dials_by_ft
  end,
  keys    = {
    {
      "<C-a>",
      function() return M.dial(true) end,
      expr = true,
      desc = "Increment",
      mode = { "n", "v" }
    },
    {
      "<C-x>",
      function() return M.dial(false) end,
      expr = true,
      desc = "Decrement",
      mode = { "n", "v" }
    },
    {
      "g<C-a>",
      function() return M.dial(true, true) end,
      expr = true,
      desc = "Increment",
      mode = { "n", "v" }
    },
    {
      "g<C-x>",
      function() return M.dial(false, true) end,
      expr = true,
      desc = "Decrement",
      mode = { "n", "v" }
    },
  },
}
