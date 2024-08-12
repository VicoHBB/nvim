local keyset = vim.keymap.set

-- Think
keyset( 'n', "<leader>", "<CMD>echo 'What to do?'<CR>",{ silent= true } )
keyset( 'n', "<leader><leader>", "<CMD>echo 'Think, Think...'<CR>",{ silent= true } )

-- Tabnine Chat
-- keyset( 'n', "gpt", "<CMD>TabnineChat<CR>", {silent= true} )

-- NvimTree
keyset( 'n', "<leader>n", "<CMD>NvimTreeToggle<CR>", {silent= true} )

-- Ranger
keyset( 'n', "<Leader>F", "<CMD>Ranger<CR>", {silent= true, desc="Open Ranger"} )

-- Vifm
keyset( 'n', "<Leader>fv", "<CMD>Vifm<CR>", {silent= true, desc="Open Ranger"} )

-- Quick Save
keyset( 'n', "<leader>w", "<CMD>w<CR>", {silent= true, desc="Quick Save"} )

-- Quick Quit
keyset( 'n', "<leader>q", "<CMD>q<CR>", {silent= true, desc ="Quick Quit"} )
keyset( 'n', "<leader>Q", "<CMD>qall!<CR>", {silent= true, desc = "Force Quit"} )

-- Split resize
keyset( 'n', "<A-l>", "2<C-w>>", {silent= true} )
keyset( 'n', "<A-h>", "2<C-w><", {silent= true} )
keyset( 'n', "<A-j>", "2<C-w>+", {silent= true} )
keyset( 'n', "<A-k>", "2<C-w>-", {silent= true} )
keyset( 'n', "<A-=>", "2<C-w>=", {silent= true} )

-- Fast ';'
keyset( 'n', "<leader>;", "$a;<ESC>", {silent= true} )

-- Fast ',"
keyset( 'n', "<leader>,", "$a,<ESC>", {silent= true} )

-- Tabs on Bufferline
keyset( 'n', "<leader>l", "<CMD>bnext<CR>", {silent= true} )
keyset( 'n', "<leader>h", "<CMD>bprevious<CR>", {silent= true} )
keyset( 'n', "<leader>x", "<CMD>bdelete<CR>", {silent= true} )

-- Split window
keyset( 'n', "<leader>|", "<CMD>vsp<CR>", {silent= true} )
keyset( 'n', "<leader>_", "<CMD>sp<CR>", {silent= true} )


-- Tmux
keyset( 'n', "<C-h>", "<CMD>TmuxNavigateLeft<CR>", {silent= true} )
keyset( 'n', "<C-j>", "<CMD>TmuxNavigateDown<CR>", {silent= true} )
keyset( 'n', "<leader><C-j>", "<CMD>TmuxNavigateDown<CR>", {silent= true} )
keyset( 'n', "<C-k>", "<CMD>TmuxNavigateUp<CR>", {silent= true} )
keyset( 'n', "<C-l>", "<CMD>TmuxNavigateRight<CR>", {silent= true} )
keyset( 'n', "<C-p>", "<CMD>TmuxNavigatePrevious<CR>", {silent= true} )

-- Floaterm
keyset( 'n', "<F1>", "<CMD>FloatermToggle<CR>", {silent= true} )
keyset('t', '<F1>', "<C-\\><C-n>:FloatermToggle<CR>", {silent=true})
-- vim.cmd([[
--   tnoremap   <silent>   <F1>    <C-\><C-n>:FloatermToggle<CR>
-- ]])
keyset( 'n', "<F2>", "<CMD>FloatermNew<CR>", {silent= true} )
keyset( 'n', "<F2>", "<C-\\><C-n><CMD>FloatermNew<CR>", {silent= true} )
keyset( 'n', "<F3>", "<CMD>FloatermPrev<CR>", {silent= true} )
keyset( 'n', "<F3>", "<C-\\><C-n><CMD>FloatermPrev<CR>", {silent= true} )
keyset( 'n', "<F4>", "<CMD>FloatermNext<CR>", {silent= true} )
keyset( 'n', "<F4>", "<C-\\><C-n><CMD>FloatermNext<CR>", {silent= true} )
keyset( 'n', "<F5>", "<CMD>FloatermKill<CR>", {silent= true} )

-- Align
keyset( {'n','v','x'}, "ga", "<Plug>(EasyAlign)", {silent= true} )

-- ISwuap
keyset( 'n', "<leader>s", "<CMD>ISwapNode<CR>", {silent= true} )
keyset( 'n', "<leader>sw", "<CMD>ISwapWith<CR>", {silent= true} )

-- Tagbar
keyset( 'n', "<F8>", "<CMD>Tagbar<CR>", {silent= true} )

-- Telescope
keyset( { 'n', 'v' }, "gs", "<CMD>Telescope grep_string<CR>", {silent= true} )
keyset( 'n', "z=", "<CMD>Telescope spell_suggest<CR>", {silent= true} )
keyset( 'n', "<leader>T", "<CMD>Telescope builtin<CR>", {silent= true} )
-- keyset( 'n', "<leader>S", "<CMD>Telescope live_grep<CR>", {silent= true} )
keyset("n", "<leader>S", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { silent= true })
keyset( 'n', "<leader>fh", "<CMD>Telescope oldfiles<CR>", {silent= true} )
keyset( 'n', "<leader>ff", "<CMD>Telescope find_files<CR>", {silent= true} )
keyset( 'n', "<leader>ty", "<CMD>Telescope yabs current_language_tasks<CR>", {silent= true} )
keyset( 'n', "<leader>tY", "<CMD>Telescope yabs global_tasks <CR>", {silent= true} )
keyset( 'n', "<leader>tc", "<CMD>Telescope commands<CR>", {silent= true} )
keyset( 'n', "<leader>tl", "<CMD>Telescope current_buffer_fuzzy_find<CR>", {silent= true} )
keyset( 'n', "<leader>tg", "<CMD>Telescope git_bcommits<CR>", {silent= true} )

-- ToDo
keyset( 'n', "<leader>tt", "<CMD>TodoQuickFix<CR>", {silent= true} )

-- Buffers
keyset('n', '<leader>b', function() require('reach').buffers() end, {silent=true})

-- Marks
keyset( 'n', "<leader>\'", function() require('reach').marks() end, {silent= true} )

-- Lazygit
keyset( 'n', "<leader>G", "<CMD>Lazygit<CR>", {silent= true} )

-- Sniprun
keyset( {'n','v'}, "<leader>qr", "<CMD>SnipRun<CR>", {silent= true} )
keyset( 'n', "<leader>qc", "<CMD>SnipClose<CR>", {silent= true} )

-- Take screenshoot
keyset( 'v', "<F10>", "<CMD>TakeScreenShot<CR><CMD>echo 'SCREENSHOT'<CR>", {silent= true} )

-- Oil
keyset("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- TrueZen
keyset( 'n', "<leader>zn", "<CMD>TZNarrow<CR>", {silent= true} )
keyset( 'v', "<leader>zn", ":'<,'>TZNarrow<CR>", {silent= true} )
keyset( 'n', "<leader>zf", "<CMD>TZFocus<CR>", {silent= true} )

-- Yabs default
keyset( 'n', "<leader>ry", "<CMD>YabsDefaultTask<CR>", {silent= true} )

-- TSJT
keyset('n', "<leader>st", "<CMD>TSJToggle<CR>", { silent = true })

-- For terminal
keyset('t', "<C-a>n", "<C-\\><C-n>", { silent= true })
keyset( 't', "<C-a>p", "<C-\\><C-n><CMD>TmuxNavigatePrevious<CR>", {silent= true} )

-- Make
keyset( 'n', "<leader>M", ":AsyncRun make ", {silent= true} )
keyset( 'n', "<leader>mS", ":AsyncStop<CR>", {silent= true} )
keyset( 'n', "<leader>ma", ":AsyncRun make all<CR>", {silent= true} )
keyset( 'n', "<leader>mr", ":AsyncRun make run<CR>", {silent= true} )
keyset( 'n', "<leader>md", ":FloatermNew make debug<CR>", {silent= true} )
keyset( 'n', "<leader>mC", ":AsyncRun make clean<CR>", {silent= true} )
keyset('n', "<leader>mq", "<CMD>AsyncRun make qrtl<CR>", { silent= true })
keyset('n', "<leader>ms", "<CMD>AsyncRun make synth<CR>", { silent= true })
keyset('n', "<leader>mv", "<CMD>AsyncRun make view<CR>", { silent= true })

-- Quickfix
keyset("n", "<F7>", function() require("quicker").toggle() end, { desc = "Toggle quickfix" })
keyset("n", "<F6>", function() require("quicker").toggle({ loclist = true }) end, { desc = "Toggle loclist", })


