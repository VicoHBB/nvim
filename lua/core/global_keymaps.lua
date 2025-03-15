local keyset = vim.keymap.set

-- Think
keyset('n', "<leader>", "<CMD>echo 'What to do?'<CR>",
    {
        silent = true,
        desc = "Leader Key (print msg)"
    }
)

-- Run Lua codo
keyset('n', "<leader>lc", ":lua ",
    {
        silent = true,
        desc = "Run lua CMD"
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
keyset('n', "<leader>;", "$a;<ESC>",
    {
        silent = true,
        desc = "Fast \";\" at the end of the line "
    }
)

-- Fast ',"
keyset('n', "<leader>,", "$a,<ESC>",
    {
        silent = true,
        desc = "Fast \",\" at the end of the line "
    }
)

-- Fast 'noh"
keyset('n', "<leader>H", "<CMD>noh<CR>", { silent = true })

-- Moves between buffers
keyset('n', "<leader>k", "<CMD>bnext<CR>", { silent = true })
keyset('n', "<leader>j", "<CMD>bprevious<CR>", { silent = true })

-- Close Buffers
keyset('n', '<leader>X', '<CMD>%bd|e#|bd#<CR>',
    {
        silent = true,
        desc = "Close the Other buffrers"
    }
)

-- Split window
keyset('n', "<leader>|", "<CMD>vsp<CR>", { silent = true })
keyset('n', "<leader>_", "<CMD>sp<CR>", { silent = true })

-- CommandLine recall
keyset('c', "<C-j>", "<Down>", {})
keyset('c', "<C-k>", "<Up>", {})

-- Sessions
keyset("n", "<leader>ms", "<CMD>mksession<CR>",
    {
        silent = true,
        desc = "Save session"
    }
)
