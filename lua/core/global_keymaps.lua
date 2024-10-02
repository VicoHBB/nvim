local keyset = vim.keymap.set

local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

-- Think
keyset('n', "<leader>", "<CMD>echo 'What to do?'<CR>", { silent = true })
keyset('n', "<leader><leader>", "<CMD>NoiceDismiss<CR>", { silent = true })

-- Tabnine Chat
keyset('n', "gT", "<CMD>TabnineChat<CR>", { silent = true })

-- NvimTree
keyset('n', "<leader>n", "<CMD>NvimTreeToggle<CR>", { silent = true })

-- Yazi
keyset('n', "<Leader>F", function()
  require("tfm").select_file_manager("yazi")
  vim.cmd("Tfm")
end, { silent = true, desc = "Open Ranger" }
)

-- Vifm
keyset('n', "<Leader>fv", function()
  require("tfm").select_file_manager("vifm")
  vim.cmd("Tfm")
end, { silent = true, desc = "Open Ranger" }
)

-- Quick Save
keyset('n', "<leader>w", "<CMD>w<CR>", { silent = true, desc = "Quick Save" })

-- Quick Quit
keyset('n', "<leader>q", "<CMD>q<CR>", { silent = true, desc = "Quick Quit" })
keyset('n', "<leader>Q", "<CMD>qall!<CR>", { silent = true, desc = "Force Quit All" })

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

-- Tabs on Bufferline
keyset('n', "<leader>k", "<CMD>bnext<CR>", { silent = true })
keyset('n', "<leader>j", "<CMD>bprevious<CR>", { silent = true })
keyset('n', "<leader>x", "<CMD>bdelete<CR>", { silent = true })

-- Split window
keyset('n', "<leader>|", "<CMD>vsp<CR>", { silent = true })
keyset('n', "<leader>_", "<CMD>sp<CR>", { silent = true })

-- Tmux
keyset('n', "<C-h>", "<CMD>TmuxNavigateLeft<CR>", { silent = true })
keyset('n', "<C-j>", "<CMD>TmuxNavigateDown<CR>", { silent = true })
keyset('n', "<leader><C-j>", "<CMD>TmuxNavigateDown<CR>", { silent = true })
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

-- Align
keyset({ 'n', 'v', 'x' }, "ga", "<Plug>(EasyAlign)", { silent = true })

-- ISwuap
keyset('n', "<leader>s", "<CMD>ISwapNode<CR>", { silent = true })
keyset('n', "<leader>sw", "<CMD>ISwapWith<CR>", { silent = true })

-- Telescope
keyset('n', "z=", "<CMD>Telescope spell_suggest<CR>", { silent = true })
keyset('n', "<leader>T", "<CMD>Telescope builtin<CR>", { silent = true })
keyset('n', "<leader>fh", "<CMD>Telescope oldfiles<CR>", { silent = true })
keyset('n', "<leader>ff", "<CMD>Telescope find_files<CR>", { silent = true })
keyset('n', "<leader>fg", "<CMD>Telescope git_files<CR>", { silent = true })
keyset('n', "<leader>tc", "<CMD>Telescope commands<CR>", { silent = true })
keyset('n', "<leader>tl", "<CMD>Telescope current_buffer_fuzzy_find<CR>", { silent = true })
keyset('n', "<leader>tg", "<CMD>Telescope git_bcommits<CR>", { silent = true })

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

-- Marks
keyset('n', "<leader>\'", function()
  require('reach').marks()
end, { silent = true })

-- Git (Neogit, Gitsigns & Lazygit)
keyset('n', "<leader>GG", "<CMD>Lazygit<CR>", { silent = true })
keyset('n', "<leader>gg", "<CMD>Neogit<CR>", { silent = true })
keyset('n', "<leader>gc", "<CMD>Neogit commit<CR>", { silent = true })
keyset('n', "<leader>gp", "<CMD>Neogit pull<CR>", { silent = true })
keyset('n', "<leader>gP", "<CMD>Neogit push<CR>", { silent = true })

-- Take screenshoot
-- keyset( 'v', "<F10>", "<CMD>TakeScreenShot<CR><CMD>echo 'SCREENSHOT'<CR>", {silent= true} )

-- Oil
keyset("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- TSJT
keyset('n', "<leader>st", "<CMD>TSJToggle<CR>", { silent = true })

-- Quickfix
keyset("n", "<F7>", function() require("quicker").toggle() end, { desc = "Toggle quickfix" })
keyset("n", "<F6>", function() require("quicker").toggle({ loclist = true }) end, { desc = "Toggle loclist", })

-- CommandLine recall
keyset('c', "<C-j>", "<Down>", {})
keyset('c', "<C-k>", "<Up>", {})

-- -- Overseer
-- keyset("n", "<F4>", "<CMD>OverseerToggle<CR>", { desc = "Toggle Overseer" })
-- keyset("n", "<leader>rt", "<CMD>OverseerRun<CR>", { desc = "Toggle Overseer" })
-- keyset("n", "<leader>rl", "<CMD>OverseerRestartLast<CR>", { desc = "Rerun last task" })

