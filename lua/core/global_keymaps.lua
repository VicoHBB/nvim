local keyset = vim.keymap.set
local telescope_builtin = require("telescope.builtin")
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

-- Think
keyset('n', "<leader>", "<CMD>echo 'What to do?'<CR>", { silent = true })

-- Tabnine Chat
keyset('n', "gT", "<CMD>TabnineChat<CR>",
  {
    silent = true,
    desc = "Open Tabnine Chat",
  }
)

-- NvimTree
keyset('n', "<leader>n", function ()
  MiniFiles.open()
end,
  {
    silent = true,
    desc = "Open MiniFiles"
  }
)

-- Yazi
keyset('n', "<Leader>F", function()
    require("tfm").select_file_manager("yazi")
    vim.cmd("Tfm")
  end,
  {
    silent = true,
    desc = "Open Yazi"
  }
)

-- Vifm
keyset('n', "<Leader>fv", function()
    require("tfm").select_file_manager("vifm")
    vim.cmd("Tfm")
  end,
  {
    silent = true,
    desc = "Open ViFm"
  }
)

-- Quick Save
keyset('n', "<leader>w", "<CMD>w<CR>",
  {
    silent = true,
    desc = "Quick Save"
  }
)

-- Quick Quit
keyset('n', "<leader>q", "<CMD>q<CR>",
  {
    silent = true,
    desc = "Quick Quit"
  }
)
keyset('n', "<leader>Q", "<CMD>qall!<CR>",
  {
    silent = true,
    desc = "Force Quit All"
  }
)

-- Split resize
keyset('n', "<A-l>", "2<C-w>>", { silent = true })
keyset('n', "<A-h>", "2<C-w><", { silent = true })
keyset('n', "<A-j>", "2<C-w>+", { silent = true })
keyset('n', "<A-k>", "2<C-w>-", { silent = true })
keyset('n', "<A-=>", "2<C-w>=", { silent = true })

-- Fast ';'
keyset('n', "<leader>;", "$a;<ESC>", { silent = true })

-- Fast ',"
keyset('n', "<leader>,", "$a,<ESC>", { silent = true })

-- Fast 'noh"
keyset('n', "<leader>H", "<CMD>noh<CR>", { silent = true })

-- Tabs on Bufferline
keyset('n', "<leader>k", "<CMD>bnext<CR>", { silent = true })
keyset('n', "<leader>j", "<CMD>bprevious<CR>", { silent = true })

-- Split window
keyset('n', "<leader>|", "<CMD>vsp<CR>", { silent = true })
keyset('n', "<leader>_", "<CMD>sp<CR>", { silent = true })

-- Tmux
keyset('n', "<C-h>", "<CMD>TmuxNavigateLeft<CR>", { silent = true })
keyset('n', "<C-j>", "<CMD>TmuxNavigateDown<CR>", { silent = true })
-- keyset('n', "<leader><C-j>", "<CMD>TmuxNavigateDown<CR>", { silent = true })
keyset('n', "<C-k>", "<CMD>TmuxNavigateUp<CR>", { silent = true })
keyset('n', "<C-l>", "<CMD>TmuxNavigateRight<CR>", { silent = true })
keyset('n', "<C-\\>", "<CMD>TmuxNavigatePrevious<CR>", { silent = true })

-- Toggleterm
-- keyset('t', 'jk', "<C-\\><C-n>", {silent=true})
keyset('n', '<F3>', "<Cmd>Telescope toggleterm_manager<CR>", { silent = true })
keyset('t', '<C-h>', "<Cmd>TmuxNavigateLeft<CR>", { silent = true })
keyset('t', '<C-j>', "<Cmd>TmuxNavigateDown<CR>", { silent = true })
keyset('t', '<C-k>', "<Cmd>TmuxNavigateUp<CR>", { silent = true })
keyset('t', '<C-l>', "<Cmd>TmuxNavigateRight<CR>", { silent = true })

-- ISwuap
keyset('n', "<leader>sn", "<CMD>ISwapNode<CR>", { silent = true })
keyset('n', "<leader>sw", "<CMD>ISwapWith<CR>", { silent = true })

-- Telescope
keyset( 'n', "z=", function ()
    telescope_builtin.spell_suggest()
end,
  {
    silent = true,
    desc = "Spell Suggest"
  }
)
keyset( 'n', "<leader>T", function ()
    telescope_builtin.builtin()
end,
  {
    silent = true,
    desc = "Telescope Builtin"
  }
)
keyset( 'n', "<leader>ff", function ()
  telescope_builtin.find_files()
end,
  {
    silent = true,
    desc = "Telescope Find Files"
  }
)
keyset( 'n', "<leader>fh", function ()
  telescope_builtin.oldfiles()
end,
  {
    silent = true,
    desc = "Telescope Old Files"
  }
)
keyset( 'n', "<leader>fg", function ()
  telescope_builtin.git_files()
end,
  {
    silent = true,
    desc = "Telescope Git Files"
  }
)
keyset( 'n', "<leader>tc", function ()
  telescope_builtin.commands()
end,
  {
    silent = true,
    desc = "Telescope Commands"
  }
)
keyset( 'n', "<leader>tl", function ()
  telescope_builtin.current_buffer_fuzzy_find()
end,
  {
    silent = true,
    desc = "Telescope Lines(Buffer Fuzzy Find)"
  }
)
keyset( 'n', "<leader>tg", function ()
  telescope_builtin.git_bcommits()
end,
  {
    silent = true,
    desc = "Telescope Buffer Commits"
  }
)
keyset( 'n', "<leader>\"", function ()
  telescope_builtin.registers()
end,
  {
    silent = true,
    desc = "Telescope Registers"
  }
)


-- Telescope live_args
keyset( "n", "<leader>S", function ()
  require('telescope').extensions.live_grep_args.live_grep_args()
end, { silent = true })
keyset( "n", "gs", function ()
    live_grep_args_shortcuts.grep_word_under_cursor()
end, { silent = true })
keyset( "v", "gs", function ()
    live_grep_args_shortcuts.grep_visual_selection()
end, { silent = true })

-- ToDo
keyset('n', "<leader>tt", "<CMD>TodoQuickFix<CR>", { silent = true })

-- Buffers
keyset('n', '<leader>b', function()
  require('reach').buffers({
    handle = 'dynamic',
  })
end, { silent = true })

keyset('n', '<leader>X', '<CMD>%bd|e#|bd#<CR>',
  {
    silent = true,
    desc = "Close the other buffrers"
  }
)

-- Marks
keyset('n', "<leader>\'", function()
  require('reach').marks()
end, { silent = true })

-- Git (Neogit, Gitsigns & LazyGit)
keyset('n', "<leader>gg", "<CMD>Neogit<CR>", { silent = true })
keyset('n', "<leader>gc", "<CMD>Neogit commit<CR>", { silent = true })
keyset('n', "<leader>gp", "<CMD>Neogit pull<CR>", { silent = true })
keyset('n', "<leader>gP", "<CMD>Neogit push<CR>", { silent = true })

keyset( { "n", "v" }, "<leader>GG", function()
    Snacks.lazygit()
  end,
  {
    silent = true,
    desc =  "Open LazyGit",
  }
)
keyset( { "n", "v" }, "<leader>gb", function()
    Snacks.git.blame_line()
  end,
  {
    silent = true,
    desc =  "Git Blame Line",
  }
)

-- Take screenshoot
-- keyset( 'v', "<F10>", "<CMD>TakeScreenShot<CR><CMD>echo 'SCREENSHOT'<CR>", {silent= true} )

-- Oil
keyset("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Quickfix
keyset("n", "<F7>", function()
    require("quicker").toggle()
  end,
  {
    silent = true,
    desc = "Toggle quickfix"
  }
)

keyset("n", "<F6>", function()
    require("quicker").toggle({
      loclist = true
    })
  end,
  {
    silent = true,
    desc = "Toggle loclist",
  }
)

-- CommandLine recall
keyset('c', "<C-j>", "<Down>", {})
keyset('c', "<C-k>", "<Up>", {})

-- Overseer
keyset("n", "<F8>", "<CMD>OverseerToggle<CR>", { desc = "Toggle Overseer" })
keyset("n", "<leader>rt", "<CMD>OverseerRun<CR>", { desc = "Toggle Overseer" })
keyset("n", "<leader>rr", "<CMD>OverseerRestartLast<CR>", { desc = "Rerun last task" })

-- Sessions
keyset("n", "<leader>ms", "<CMD>mksession<CR>",
  {
    desc = "Save session"
  }
)

keyset("n", "<leader>rs", function ()
  MiniSessions.read()
end,
  {
    desc = "Read Session"
  }
)
