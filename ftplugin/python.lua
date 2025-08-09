-- ============================================================================
-- Local variables
-- ============================================================================
local keyset       = vim.keymap.set
local trim_spaces  = false
local overseer     = require('overseer')

-- ============================================================================
-- Buffer variables
-- ============================================================================
vim.wo.colorcolumn = "120"
vim.bo.autoindent  = true

-- ============================================================================
-- Overseer Tasks
-- ============================================================================

-- Run UV project
overseer.register_template({
    name = 'UVRun',
    builder = function(opts)
        return {
            name = opts.name or 'Run UV Project',
            cmd = { 'uv' },
            args = { 'run', 'src/main.py' }
        }
    end,
    condition = {
        filetype = { "python" }
    }
})

-- Run Pytest
overseer.register_template({
    name = 'pytest',
    builder = function(opts)
        return {
            name = opts.name or 'pytest',
            cmd = { 'uv' },
            args = { 'run', 'pytest' },
        }
    end,
    condition = {
        filetype = { "python" }
    }
})

-- Run file
overseer.register_template({
    name = 'UVRunFile',
    builder = function(opts)
        return {
            name = opts.name or 'Run File',
            cmd = {'uv',},
            args = {'run', vim.fn.expand('%')},
        }
    end,
    condition = {
        filetype = { "python" }
    }
})

-- Start Virtual Environment
overseer.register_template({
    name = 'UVenv',
    builder = function(opts)
        return {
            name = opts.name or 'Init venv',
            cmd = {'uv',},
            args = {'venv'},
        }
    end,
    condition = {
        filetype = { "python" }
    }
})

-- ============================================================================
-- Autocommands
-- ============================================================================

-- ============================================================================
-- Keymaps
-- ============================================================================

-- Compilation & Simulation

keyset('n', "<F9>", "<CMD>OverseerRun UVRun<CR>",
    {
        buffer = 0,
        noremap = true,
        silent = true,
        desc = "Run UV Project",
    }
)

keyset('n', "<F10>", "<CMD>OverseerRunCmd pytest<CR>",
    {
        buffer = 0,
        noremap = true,
        silent = true,
        desc = "Run file",
    }
)

keyset("n", "<leader>rf", "<CMD>TermExec cmd='run %'<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Run File On REPL",
})


-- Utilities
keyset("v", "<leader>rl", function()
        -- require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
        require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = 1 })
    end,
    {
        buffer = 0,
        noremap = true,
        silent = true,
        desc = "Run lines on REPL",
    }
)

keyset("n", "<leader>rl", function()
        require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = 1 })
    end,
    {
        buffer = 0,
        noremap = true,
        silent = true,
        desc = "Run lines on REPL",
    }
)
