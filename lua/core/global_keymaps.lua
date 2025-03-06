local fzf = require("fzf-lua")
local keyset = vim.keymap.set
-- local telescope_builtin = require("telescope.builtin")
-- local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

-- Think
keyset('n', "<leader>", "<CMD>echo 'What to do?'<CR>", { silent = true })

-- Tabnine Chat
keyset('n', "<leader>T", "<CMD>TabnineChat<CR>",
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

-- Quick all Save
keyset('n', "<leader>W", "<CMD>wall<CR>",
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

-- Toggleterm
keyset('n', '<F3>', "<CMD>TermSelect<CR>",
  {
    silent = true,
    desc = "Select Terminal",
  }
)

-- Navigate trow splits & tmux
keyset({ 'n', 't' }, '<C-h>', require('smart-splits').move_cursor_left,
  {
    silent = true,
    desc = "Navigate Left",
  }
)
keyset({ 'n', 't' }, '<C-j>', require('smart-splits').move_cursor_down,
  {
    silent = true,
    desc = "Navigate Down",
  }
)
keyset({ 'n', 't' }, '<C-k>', require('smart-splits').move_cursor_up,
  {
    silent = true,
    desc = "Navigate Up",
  }
)
keyset({ 'n', 't' }, '<C-l>', require('smart-splits').move_cursor_right,
  {
    silent = true,
    desc = "Navigate Right",
  }
)
keyset({ 'n', 't' }, '<C-\\><C-\\>', require('smart-splits').move_cursor_previous,
  {
    silent = true,
    desc = "Navigate to Previous",
  }
)

-- Rezising splits & tmux
keyset({ 'n', 't' }, '<A-h>', require('smart-splits').resize_left,
  {
    silent = true,
    desc = "Rezize to Left"
  }
)
keyset({ 'n', 't' }, '<A-j>', require('smart-splits').resize_down,
  {
    silent = true,
    desc = "Rezize to Down"
  }
)
keyset({ 'n', 't' }, '<A-k>', require('smart-splits').resize_up,
  {
    silent = true,
    desc = "Rezize to Up"
  }
)
keyset({ 'n', 't' }, '<A-l>', require('smart-splits').resize_right,
  {
    silent = true,
    desc = "Rezize to Right"
  }
)
keyset({ 'n', 't' }, '<A-=>', "<C-w>=",
  {
    silent = true,
    desc = "Rezize to Right"
  }
)

-- Swap buffers
-- swapping buffers between windows
keyset('n', '<leader><C-h>', require('smart-splits').swap_buf_left,
  {
    silent = true,
    desc = "Swap to Right"
  }
)
keyset('n', '<leader><C-j>', require('smart-splits').swap_buf_down,
  {
    silent = true,
    desc = "Swap to Right"
  }
)
keyset('n', '<leader><C-k>', require('smart-splits').swap_buf_up,
  {
    silent = true,
    desc = "Swap to Right"
  }
)
keyset('n', '<leader><C-l>', require('smart-splits').swap_buf_right,
  {
    silent = true,
    desc = "Swap to Right"
  }
)

-- -- Terminal
-- keyset('t', 'jk', "<C-\\><C-n>", {silent=true})

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
    desc = "Search exact word"
  }
)
keyset("n", "gS", fzf.grep_cWORD,
  {
    silent = true,
    desc = "Search word"
  }
)
keyset("v", "gs", fzf.grep_visual,
  {
    silent = true,
    desc = "Search visual selection"
  }
)
keyset("n", "<leader>ft", fzf.tags,
  {
    silent = true,
    desc = "Search tags"
  }
)
keyset("n", "g]", fzf.tags_grep_cword,
  {
    silent = true,
    desc = "Search tag under the cursor"
  }
)
keyset("v", "g]", fzf.tags_grep_visual,
  {
    silent = true,
    desc = "Search visual selection on tags"
  }
)

-- ToDo
keyset('n', "<leader>tt", "<CMD>TodoQuickFix<CR>", { silent = true })

keyset('n', '<leader>X', '<CMD>%bd|e#|bd#<CR>',
  {
    silent = true,
    desc = "Close the other buffrers"
  }
)

-- Git (Neogit, Gitsigns & LazyGit)
keyset('n', "<leader>gg", "<CMD>Neogit<CR>", { silent = true })
keyset('n', "<leader>gc", "<CMD>Neogit commit<CR>", { silent = true })
keyset('n', "<leader>gp", "<CMD>Neogit pull<CR>", { silent = true })
keyset('n', "<leader>gP", "<CMD>Neogit push<CR>", { silent = true })

-- Take screenshoot
-- keyset( 'v', "<F10>", "<CMD>TakeScreenShot<CR><CMD>echo 'SCREENSHOT'<CR>", {silent= true} )

-- Oil
keyset("n", "-", require("oil").open,
  {
    silent = true,
    desc = "Open Oil"
  }
)

-- CommandLine recall
keyset('c', "<C-j>", "<Down>", {})
keyset('c', "<C-k>", "<Up>", {})

-- Overseer
keyset("n", "<F8>", "<CMD>OverseerToggle<CR>",
  {
    silent = true,
    desc = "Toggle Overseer"
  }
)
keyset("n", "<leader>rt", "<CMD>OverseerRun<CR>",
  {
    silent = true,
    desc = "Toggle Overseer"
  }
)
keyset("n", "<leader>rr", "<CMD>OverseerRestartLast<CR>",
  {
    silent = true,
    desc = "Rerun last task"
  }
)

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
    desc = "Save session"
  }
)
