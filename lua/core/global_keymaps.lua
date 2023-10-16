local keyset = vim.keymap.set
-- Think
keyset( 'n', "<space>", "<CMD>echo 'What to do?'<CR>",{ silent= true } )
keyset( 'n', "<space><space>", "<CMD>echo 'Think, Think...'<CR>",{ silent= true } )

-- GoTo
keyset( "n", "gd", "<CMD>Lspsaga goto_definition<CR>", {silent = true} )
keyset( "n", "gr", "<CMD>Lspsaga finder<CR>", {silent = true} )
keyset( "n", "gt", "<CMD>Lspsaga peek_definition<CR>", {silent = true} )
-- GoTo preview
keyset( "n", "gpd", require('goto-preview').goto_preview_definition, {silent = true} )
keyset( "n", "gpr", require('goto-preview').goto_preview_references, {silent = true} )
keyset( "n", "gpi", require('goto-preview').goto_preview_implementation, {silent = true} )
keyset( "n", "gP", require('goto-preview').close_all_win, {silent = true} )

-- Format
keyset( 'v' , '<leader>f', function()
  vim.lsp.buf.format { async = true }
end)

-- Rename
keyset( 'n', "<leader>R", "<CMD>Lspsaga rename<CR>", {silent = true} )

-- Code Action Menu
keyset( 'n', "<leader>a", "<CMD>CodeActionMenu<CR>", {silent= true} )

-- ChatGPT
-- keyset( 'n', "gpt", "<CMD>ChatGPT<CR>", {silent= true} )

-- HOP
keyset( 'n', "gc", "<CMD>HopChar2<CR>", {silent= true} )
keyset( 'n', "gw", "<CMD>HopWord<CR>", {silent= true} )
keyset( 'n', "gl", "<CMD>HopLine<CR>", {silent= true} )
keyset( 'n', "gW", "<CMD>HopPattern<CR>", {silent= true} )

-- NvimTree
keyset( 'n', "<leader>n", "<CMD>NvimTreeToggle<CR>", {silent= true} )

-- Navbuddy
keyset( 'n', "<leader>N", "<CMD>Navbuddy<CR>", {silent= true} )

-- Ranger
keyset( 'n', "F", "<CMD>RnvimrToggle<CR>", {silent= true} )

-- Quick Save
keyset( 'n', "<leader>w", ":w<CR>", {silent= true} )

-- Quick Quit
keyset( 'n', "<leader>q", ":q<CR>", {silent= true} )
keyset( 'n', "<leader>Q", ":q!<CR>", {silent= true} )

-- Split resize
keyset( 'n', "<A-l>", "2<C-w>>", {silent= true} )
keyset( 'n', "<A-h>", "2<C-w><", {silent= true} )
keyset( 'n', "<A-j>", "2<C-w>+", {silent= true} )
keyset( 'n', "<A-k>", "2<C-w>-", {silent= true} )
keyset( 'n', "<A-=>", "2<C-w>=", {silent= true} )

-- Fast ';'
keyset( 'n', "<leader>;", "$a;<ESC>", {silent= true} )

-- Tabs on Bufferline
keyset( 'n', "<Tab>", "<CMD>bnext<CR>", {silent= true} )
keyset( 'n', "<S-Tab>", "<CMD>bprevious<CR>", {silent= true} )
keyset( 'n', "<leader><Tab>", "<CMD>bdelete<CR>", {silent= true} )

-- Tmux
keyset( 'n', "<C-h>", "<CMD>TmuxNavigateLeft<CR>", {silent= true} )
keyset( 'n', "<C-j>", "<CMD>TmuxNavigateDown<CR>", {silent= true} )
keyset( 'n', "tj", "<CMD>TmuxNavigateDown<CR>", {silent= true} )
keyset( 'n', "<C-k>", "<CMD>TmuxNavigateUp<CR>", {silent= true} )
keyset( 'n', "<C-l>", "<CMD>TmuxNavigateRight<CR>", {silent= true} )
keyset( 'n', "<C-p>", "<CMD>TmuxNavigatePrevious<CR>", {silent= true} )

-- Signify
-- keyset( 'n', "<F6>", "<CMD>SignifyHunkDiff<CR>", {silent= true} )
-- keyset( 'n', "<F7>", "<CMD>SignifyToggleHighlight<CR>", {silent= true} )

-- FZF
keyset( 'n', "<leader>L", "<CMD>Lines<CR>", {silent= true} )
keyset( 'n', "<leader>S", "<CMD>RG<CR>", {silent= true} )
keyset( 'n', "fzh", "<CMD>History<CR>", {silent= true} )
keyset( 'n', "fzf", "<CMD>FZF<CR>", {silent= true} )

-- Floaterm
keyset( 'n', "<F1>", "<CMD>FloatermToggle<CR>", {silent= true} )
vim.cmd([[
  tnoremap   <silent>   <F1>    <C-\><C-n>:FloatermToggle<CR>
]])
keyset( 'n', "<F2>", "<CMD>FloatermNew<CR>", {silent= true} )
keyset( 'n', "<F2>", "<C-\\><C-n><CMD>FloatermNew<CR>", {silent= true} )
keyset( 'n', "<F3>", "<CMD>FloatermPrev<CR>", {silent= true} )
keyset( 'n', "<F3>", "<C-\\><C-n><CMD>FloatermPrev<CR>", {silent= true} )
keyset( 'n', "<F4>", "<CMD>FloatermNext<CR>", {silent= true} )
keyset( 'n', "<F4>", "<C-\\><C-n><CMD>FloatermNext<CR>", {silent= true} )
keyset( 'n', "<F5>", "<CMD>FloatermKill<CR>", {silent= true} )

-- Align
keyset( {'n','x'}, "ga", "<Plug>(EasyAlign)", {silent= true} )

-- ISwuap
keyset( 'n', "<leader>s", "<CMD>ISwapNode<CR>", {silent= true} )
keyset( 'n', "<leader>sw", "<CMD>ISwapWith<CR>", {silent= true} )

-- Tabbar
keyset( 'n', "tag", "<CMD>Tagbar<CR>", {silent= true} )

-- Telescope
keyset( 'n', "<leader>t", "<CMD>Telescope builtin<CR>", {silent= true} )
keyset( 'n', "tb", "<CMD>Telescope buffers<CR>", {silent= true} )
keyset( 'n', "cmd", "<CMD>Telescope commands theme=dropdown<CR>", {silent= true} )
keyset( 'n', "th", "<CMD>Telescope oldfiles<CR>", {silent= true} )
keyset( 'n', "ff", "<CMD>Telescope fd<CR>", {silent= true} )
keyset( 'n', "<leader>h", "<CMD>Telescope harpoon marks<CR>", {silent= true} )
keyset( 'n', "tm", "<CMD>Telescope marks<CR>", {silent= true} )
keyset( 'n', "ty", "<CMD>Telescope yabs current_language_tasks <CR>", {silent= true} )
keyset( 'n', "tc", "<CMD>Telescope yabs current_language_tasks <CR>", {silent= true} )
keyset( 'n', "tc", "<CMD>Telescope yabs current_language_tasks <CR>", {silent= true} )
keyset( 'n', "tY", "<CMD>Telescope yabs global_tasks <CR>", {silent= true} )
keyset( 'n', "ts", "<CMD>Telescope spell_suggest<CR>", {silent= true} )
keyset( 'n', "tt", "<CMD>TodoTrouble<CR>", {silent= true} )

-- AnyJump
-- keyset( { 'n', 'x' }, "<leader>j", "<CMD>AnyJump<CR>", {silent= true} )
-- AnyJump with Telescope
keyset( { 'n', 'x', 'v' }, "<leader>J", "<CMD>Telescope grep_string<CR>", {silent= true} )

-- Marks
keyset( 'n', "tM", "<CMD>MarksToggleSigns<CR>", {silent= true} )

-- Harpoon
keyset( "n", "<leader>A", require('harpoon.mark').add_file, {silent = true} )
keyset( "n", "<leader>>", require('harpoon.ui').nav_next, {silent = true} )
keyset( "n", "<leader><", require('harpoon.ui').nav_prev, {silent = true} )

-- Bufferline
keyset( 'n', "<leader>b", "<CMD>BufferLinePick<CR>", {silent= true} )

-- Lazygit
keyset( 'n', "<leader>g", "<CMD>LazyGit<CR>", {silent= true} )

-- Sniprun
keyset( {'n','v'}, "<leader>qr", "<CMD>SnipRun<CR>", {silent= true} )
keyset( 'n', "<leader>qc", "<CMD>SnipClose<CR>", {silent= true} )

-- Take screenshoot
keyset( 'v', "ts", "<CMD>TakeScreenShot<CR><CMD>echo 'SCREENSHOT'<CR>", {silent= true} )

-- LSPSAGA Dx
keyset( 'n', "<leader>[", "<CMD>Lspsaga diagnostic_jump_prev<CR>", {silent= true} )
keyset( 'n', "<leader>]", "<CMD>Lspsaga diagnostic_jump_next<CR>", {silent= true} )
keyset( 'n', "<leader>?", "<CMD>TroubleToggle workspace_diagnostics<CR>", {silent= true} )

-- Oil
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

-- TrueZen
keyset( 'n', "<leader>zn", "<CMD>TZNarrow<CR>", {silent= true} )
keyset( 'v', "<leader>zn", ":'<,'>TZNarrow<CR>", {silent= true} )
keyset( 'n', "<leader>zf", "<CMD>TZFocus<CR>", {silent= true} )

-- Yabs default
keyset( 'n', "<leader>ry", "<CMD>YabsDefaultTask<CR>", {silent= true} )

-- Termiantor
keyset( 'n', "<leader>rc", "<CMD>TerminatorOutputBufferClose<CR>", {silent= true} )

-- TSJT
keyset('n', "<leader>st", "<CMD>TSJToggle<CR>", { silent = true })

-- For terminal
keyset( 't', "<C-a>n", "<C-\\><C-n>", {silent= true} )
keyset( 't', "<C-a>p", "<C-\\><C-n><CMD>TmuxNavigatePrevious<CR>", {silent= true} )

-- Make
keyset( 'n', "<leader>M", ":AsyncRun make ", {silent= true} )
keyset( 'n', "<leader>ma", ":AsyncRun make all<CR>", {silent= true} )
keyset( 'n', "<leader>mr", ":AsyncRun make run<CR>", {silent= true} )
keyset( 'n', "<leader>md", ":FloatermNew make debug<CR>", {silent= true} )
keyset( 'n', "<leader>mC", ":AsyncRun make clean<CR>", {silent= true} )
keyset('n', "<leader>mq", "<CMD>AsyncRun make qrtl<CR>", { silent= true })
keyset('n', "<leader>ms", "<CMD>AsyncRun make synth<CR>", { silent= true })
keyset('n', "<leader>mv", "<CMD>AsyncRun make view<CR>", { silent= true })
