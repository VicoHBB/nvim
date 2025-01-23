local bigfile_opt = {
  enabled = true,
  notify = true,
  size = 1.5 * 1024 * 1024,     -- 1.5MB
  setup = function(ctx)
    if vim.fn.exists(":NoMatchParen") ~= 0 then
      vim.cmd([[NoMatchParen]])
    end
    Snacks.util.wo(0, {
      foldmethod = "manual",
      statuscolumn = "",
      conceallevel = 0,
    })
    vim.b.minianimate_disable = true
    vim.schedule(function()
      vim.bo[ctx.buf].syntax = ctx.ft
    end)
  end,
}

local dashboard_opt = {
  enabled = true,
  preset = {
    -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
    ---@type fun(cmd:string, opts:table)|nil
    pick = nil,
    -- Used by the `keys` section to show keymaps.
    -- Set your custom keymaps here.
    -- When using a function, the `items` argument are the default keymaps.
    ---@type snacks.dashboard.Item[]
    keys = {
      {
        icon = " ",
        key = "e",
        desc = "New File",
        action = "<CMD>ene | startinsert<CR>",
      },
      -- {
      --   key = "P",
      --   icon = "",
      --   desc = "Projects",
      --   action = "<CMD>Telescope projects<CR>",
      -- },
      {
        icon = " ",
        key = "<Space>fh",
        desc = "Complete History",
        action = "<CMD>Telescope oldfiles<CR>",
      },
      {
        icon = " ",
        key = "<Space>ff",
        desc = "Find Files",
        action = "<CMD>Telescope find_files<CR>",
      },
      {
        icon = " ",
        key = "<Space>F",
        desc = "File Browser",
        action = function()
          require("tfm").select_file_manager("yazi")
          vim.cmd("Tfm")
        end,
      },
      {
        icon = " ",
        key = "<Space>S",
        desc = "Find Text",
        action = function()
          require('telescope').extensions.live_grep_args.live_grep_args()
        end ,
      },
      {
        icon = " ",
        key = "N",
        desc = "Neovim News",
        action = function()
          Snacks.win({
            file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
            width = 0.6,
            height = 0.6,
            wo = {
              spell = false,
              wrap = false,
              signcolumn = "yes",
              statuscolumn = " ",
              conceallevel = 3,
            },
          })
        end,
      },
      {
        icon = "󰒲 ",
        key = "L",
        desc = "Lazy",
        action = "<CMD>Lazy<CR>",
        enabled = package.loaded.lazy ~= nil,
      },
      {
        icon = "󰟾",
        key = "M",
        desc = "Mason",
        action = "<CMD>Mason<CR>",
      },
      {
        icon = "󰀯 ",
        key = "ch",
        desc = "Checkhealth",
        action = "<CMD>checkhealth<CR>",
      },
      {
        icon = " ",
        key = "cc",
        desc = "Config",
        action =  function ()
          require("telescope.builtin").find_files({
            cwd = vim.fn.stdpath('config'),
          })
        end
      },
      {
        icon = " ",
        key = "Q",
        desc = "Quit",
        action = "<CMD>qa<CR>",
      },
    },
    -- Used by the `header` section
    header = [[
                            

███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
 Welcome 
                            
I'm more what I think of my self, I really have to be...
]],

  },

  sections = {
    { section = "header" },
    {
      pane = 2,
      icon = " ",
      title = "Git Status",
      section = "terminal",
      enabled = function()
        return Snacks.git.get_root() ~= nil
      end,
      -- cmd = "git status --short --branch --renames",
      cmd = "git --no-pager diff --stat -B -M -C",
      height = 5,
      padding = 1,
      ttl = 5 * 60,
      indent = 3,
    },
    {
      pane = 2,
      icon = " ",
      title = "Recent Files",
      section = "recent_files",
      indent = 2,
      padding = 1,
    },
    {
      pane = 2,
      icon = " ",
      title = "Projects",
      section = "projects",
      indent = 2,
      padding = 1,
    },
    {
      section = "keys",
      gap = 0.9,
      padding = 1,
    },
    {
      section = "startup",
    },
  },
}

local notifier_opt = {
  enabled = true,
}

local quickfile_opt = {
  enabled = true,
  exclude = {
    -- Files to exclude
  },
}

local indent_opt = {
  enabled = true,
}

local input_opt = {
  enabled = true,
}

local scroll_opt = {
  enabled = true,
}

local statuscolumn_opt = {
  enabled = true,
  left = { "sign", "mark" }, -- priority of signs on the left (high to low)
  right = { "fold", "git" }, -- priority of signs on the right (high to low)
  folds = {
    open = true, -- show open fold icons
    git_hl = false, -- use Git Signs hl for fold icons
  },
  git = {
    -- patterns to match Git signs
    patterns = { "GitSign", "MiniDiffSign" },
  },
  refresh = 50, -- refresh at most every 50ms
}

local words_opt = {
  enabled = true,
}

local scope_opt = {
  enabled = true,
}

local picker_opt = {
  enabled = false,
}

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
    notifier = notifier_opt,
    quickfile = quickfile_opt,
    indent = indent_opt,
    input = input_opt,
    scroll = scroll_opt,
    statuscolumn = statuscolumn_opt,
    words = words_opt,
    picker = picker_opt,
    scope = scope_opt,
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
      "<leader>db",
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
