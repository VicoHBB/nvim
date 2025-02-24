local fzf = require("fzf-lua")
local keyset = vim.keymap.set
-- local telescope_builtin = require("telescope.builtin")
-- local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

-- Think
keyset('n', "<leader>", "<CMD>echo 'What to do?'<CR>", { silent = true })

-- Tabnine Chat
keyset('n', "T", "<CMD>TabnineChat<CR>",
  {
    silent = true,
    desc = "Open Tabnine Chat",
  }
)

-- MiniFiles
keyset('n', "<leader>mf", MiniFiles.open,
  {
    silent = true,
    desc = "Open MiniFiles"
  }
)

-- Yazi
keyset('n', "<Leader>F", function()
    require("tfm").select_file_manager("yazi")
    require("tfm").open()
  end,
  {
    silent = true,
    desc = "Open Yazi"
  }
)

-- Vifm
keyset('n', "<Leader>fV", function()
    require("tfm").select_file_manager("vifm")
    require("tfm").open()
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
keyset('n', '<F3>', "<CMD>TermSelect<CR>",
  {
    silent = true,
    desc = "Select Terminal",
  }
)

-- Navigate trow splits
-- keyset('t', 'jk', "<C-\\><C-n>", {silent=true})
keyset('t', '<C-h>', "<Cmd>TmuxNavigateLeft<CR>",
  {
    silent = true,
    desc = "Navigate Left",
  }
)
keyset('t', '<C-j>', "<Cmd>TmuxNavigateDown<CR>",
  {
    silent = true,
    desc = "Navigate Down",
  }
)
keyset('t', '<C-k>', "<Cmd>TmuxNavigateUp<CR>",
  {
    silent = true,
    desc = "Navigate Up",
  }
)
keyset('t', '<C-l>', "<Cmd>TmuxNavigateRight<CR>",
  {
    silent = true,
    desc = "Navigate Right",
  }
)

-- ISwuap
keyset('n', "<leader>sn", "<CMD>ISwapNode<CR>", { silent = true })
keyset('n', "<leader>sw", "<CMD>ISwapWith<CR>", { silent = true })

-- FZF lua
keyset( 'n', "<F1>", fzf.help_tags,
  {
    silent = true,
    desc = "Help Tags"
  }
)
keyset( 'n', "z=", fzf.spell_suggest,
  {
    silent = true,
    desc = "Spell Suggest"
  }
)
keyset( 'n', "<leader>fr", fzf.resume,
  {
    silent = true,
    desc = "FZFLua Resume Last Builtin"
  }
)
keyset( 'n', "<leader>fz", fzf.builtin,
  {
    silent = true,
    desc = "FZFLua Builtin"
  }
)
keyset( 'n', "<leader>ff", fzf.files,
  {
    silent = true,
    desc = "FZFLua Find Files"
  }
)
keyset( 'n', "<leader>fo", fzf.oldfiles,
  {
    silent = true,
    desc = "FZFLua Old Files"
  }
)
keyset( 'n', "<leader>fg", fzf.git_files,
  {
    silent = true,
    desc = "FZFLua Git Files"
  }
)
keyset( 'n', "<leader>fc", fzf.commands,
  {
    silent = true,
    desc = "FZFLua Commands"
  }
)
keyset( 'n', "<leader>fl", fzf.blines,
  {
    silent = true,
    desc = "FZFLua Lines"
  }
)
keyset( 'n', "<leader>fh", fzf.git_bcommits,
  {
    silent = true,
    desc = "FZFLua Buffer Commits"
  }
)

keyset( 'n', "<leader>\"", fzf.registers,
  {
    silent = true,
    desc = "FZFLua Registers"
  }
)

keyset( 'n', "<leader>fv", fzf.nvim_options,
  {
    silent = true,
    desc = "FZFLua vim_options"
  }
)

-- FZFLua grep
keyset("n", "<leader>S", fzf.live_grep,
  {
    silent = true
  }
)
keyset("n", "gs", fzf.grep_cword,
  {
    silent = true,
    desc = "Serach exact word"
  }
)
keyset("n", "gS", fzf.grep_cWORD,
  {
    silent = true,
    desc = "Serach word"
  }
)
keyset("v", "gs", fzf.grep_visual,
  {
    silent = true,
    desc = "Serach visual selection"
  }
)

-- ToDo
keyset('n', "<leader>tt", "<CMD>TodoQuickFix<CR>", { silent = true })

-- Buffers
keyset('n', '<leader>b', function()
    require('reach').buffers({
      handle = 'dynamic',
    })
  end,
  {
    silent = true,
    desc = "Switch Buffer"
  }
)

keyset('n', '<leader>X', '<CMD>%bd|e#|bd#<CR>',
  {
    silent = true,
    desc = "Close the other buffrers"
  }
)

-- Marks
keyset('n', "<leader>\'", require('reach').marks,
  {
    silent = true,
    desc = "Move to mark"
  }
)

-- Git (Neogit, Gitsigns & LazyGit)
keyset('n', "<leader>gg", "<CMD>Neogit<CR>", { silent = true })
keyset('n', "<leader>gc", "<CMD>Neogit commit<CR>", { silent = true })
keyset('n', "<leader>gp", "<CMD>Neogit pull<CR>", { silent = true })
keyset('n', "<leader>gP", "<CMD>Neogit push<CR>", { silent = true })

keyset( { "n", "v" }, "<leader>GG", Snacks.lazygit.open,
  {
    silent = true,
    desc =  "Open LazyGit",
  }
)

keyset( { "n", "v" }, "<leader>gb",
    Snacks.git.blame_line,
  {
    silent = true,
    desc =  "Git Blame Line",
  }
)

-- Take screenshoot
-- keyset( 'v', "<F10>", "<CMD>TakeScreenShot<CR><CMD>echo 'SCREENSHOT'<CR>", {silent= true} )

-- Oil
keyset("n", "-", require("oil").open,
  {
    silent = true,
    desc = "Open Oil"
  }
)

-- Quickfix
keyset("n", "<F7>", require("quicker").toggle,
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

keyset("n", "<leader>(", "<CMD>cprevious<CR>zz",
  {
    silent = true,
    desc = "Go to Preview item on Quickfix",
  }
)

keyset("n", "<leader>)", "<CMD>cnext<CR>zz",
  {
    silent = true,
    desc = "Go to Next item on Quickfix",
  }
)

keyset("n", "<leader>cp", "<CMD>cprevious<CR>zz",
  {
    silent = true,
    desc = "Go to Preview item on Quickfix",
  }
)

keyset("n", "<leader>cn", "<CMD>cnext<CR>zz",
  {
    silent = true,
    desc = "Go to Next item on Quickfix",
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
    silent = true,
    desc = "Save session"
  }
)

keyset("n", "<leader>rs", MiniSessions.read,
  {
    silent = true,
    desc = "Read Session"
  }
)
