local simple_opts = require('plugins.snacks_configs.simple_opt')
local bigfile_opt = require('plugins.snacks_configs.bigfile').opt
local dashboard_opt = require('plugins.snacks_configs.dashboard').opt
local statuscolumn_opt = require('plugins.snacks_configs.statuscolumn').opt
local picker_opt = require('plugins.snacks_configs.picker').opt


local function set_web_devicons(name, cat)
  local try = {
    function()
      if cat == "directory" then
        return "󰉋 ", "Directory"
      end
      local Icons = require("nvim-web-devicons")
      if cat == "filetype" then
        return Icons.get_icon_by_filetype(name, { default = false })
      elseif cat == "file" then
        local ext = name:match("%.(%w+)$")
        return Icons.get_icon(name, ext, { default = false }) --[[@as string, string]]
      elseif cat == "extension" then
        return Icons.get_icon(nil, name, { default = false }) --[[@as string, string]]
      end
    end,
    function()
      return require("mini.icons").get(cat or "file", name)
    end,
  }
  for _, fn in ipairs(try) do
    local ret = { pcall(fn) }
    if ret[1] and ret[2] then
      return ret[2], ret[3]
    end
  end
  return "󰈔 "
end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = bigfile_opt,
    dashboard = dashboard_opt,
    statuscolumn = statuscolumn_opt,
    notifier = simple_opts.notifier,
    quickfile = simple_opts.quickfile,
    indent = simple_opts.indent,
    input = simple_opts.input,
    scroll = simple_opts.scroll,
    words = simple_opts.words,
    picker = picker_opt,
    scope = simple_opts.scope,
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Set web devicons
        Snacks.util.icon = set_web_devicons

        -- Create some toggle mappings
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.dim():map("<leader>uD")
      end,
      pattern = "VeryLazy",
    })
  end,
  keys = {
    {
      "<leader>z",
      function()
        Snacks.zen()
      end,
      desc = "Toggle Zen Mode",
    },
    {
      "<leader>Z",
      function()
        Snacks.zen.zoom()
      end,
      desc = "Toggle Zoom",
    },
    {
      "<leader>x",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete Buffer",
    },
    {
      "<leader><leader>",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "<leader>un",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification History",
    },
  },
}
