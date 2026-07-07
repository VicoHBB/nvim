-- Fixed high counts keep the REPLs addressable and out of the way of the
-- regular <F2> terminals (1..N); prompt is what get_repl waits for on first
-- start before sends (bytes sent earlier get echoed raw above the banner)
local interpreters = {
    lua = {
        cmd = "luap",
        count = 98,
        prompt = ">",
        run = [[dofile("%")]],
        trim = true,
    },
    python = {
        cmd = "uv run ipython --no-autoindent",
        count = 99,
        prompt = "In %[%d+%]:",
        run = "run %",
        trim = false,
    },
}

local repls = {}

-- Cached per-filetype REPL terminal; open=true also makes sure it is running
-- (without stealing focus) so the send-to-REPL keymaps can auto-start it
local function get_repl(ft, open)
    local interpreter = interpreters[ft]
    if not interpreter then
        return nil
    end

    if not repls[ft] then
        local Terminal = require('toggleterm.terminal').Terminal
        repls[ft] = Terminal:new({
            name = "REPL",
            cmd = interpreter.cmd,
            count = interpreter.count,
        })
    end

    if open and not repls[ft]:is_open() then
        local win = vim.api.nvim_get_current_win()
        local repl = repls[ft]
        repl:open()
        vim.api.nvim_set_current_win(win)

        -- Wait (up to 5s) for the interpreter's first prompt before returning
        vim.wait(5000, function()
            local lines = vim.api.nvim_buf_get_lines(repl.bufnr, 0, -1, false)
            return table.concat(lines, "\n"):find(interpreter.prompt) ~= nil
        end, 50)
    end

    return repls[ft]
end

-- Generic helpers for the REPL keymaps: the filetype picks the interpreter
local function repl_run_file()
    local ft = vim.bo.filetype
    local repl = get_repl(ft, true)
    vim.cmd(repl.count .. "TermExec cmd='" .. interpreters[ft].run .. "'")
end

local function repl_send_lines(selection_type)
    local ft = vim.bo.filetype
    local repl = get_repl(ft, true)
    require("toggleterm").send_lines_to_terminal(selection_type, interpreters[ft].trim, { args = repl.count })
end

return {
    'akinsho/toggleterm.nvim',
    enabled = Is_Not_Win32, -- @TODO: Review this
    -- lazy = true,
    -- event = "VeryLazy",
    cmd = {
        "ToggleTerm",
        "TermExec",
    },
    version = "*",
    opts = {
        open_mapping = "<F2>",
    },
    init = function()
        local autocmd = vim.api.nvim_create_autocmd
        local buf_cmd = vim.api.nvim_buf_create_user_command

        -- :REPL lives in init so the command exists without loading the plugin (it loads on first use).
        -- FileType instead of the old pattern-less User autocmd: fires per matching buffer, including
        -- files passed on the cmdline. No augroup: init runs once per startup.
        autocmd("FileType", {
            pattern = vim.tbl_keys(interpreters),
            callback = function(event)
                buf_cmd(event.buf, "REPL", function()
                        get_repl(event.match):toggle()
                    end,
                    {
                        nargs = 0,
                        desc = "Start REPL"
                    }
                )
            end,
        })
    end,
    keys = {
        {
            "<F2>",
            desc = "Open ToggleTerm"
        },
        {
            '<F3>',
            function()
                vim.cmd("TermSelect")
            end,
            mode = { 'n' },
            silent = true,
            desc = "Select Terminal",
        },
        {
            '<F12>',
            function()
                vim.cmd("REPL")
            end,
            mode = { 'n' },
            ft = { "lua", "python" },
            silent = true,
            desc = "Start REPL",
        },
        {
            "<leader>rf",
            repl_run_file,
            mode = { 'n' },
            ft = { "lua", "python" },
            silent = true,
            desc = "Run File On REPL",
        },
        {
            "<leader>rl",
            function()
                repl_send_lines("single_line")
            end,
            mode = { 'n' },
            ft = { "lua", "python" },
            silent = true,
            desc = "Run lines on REPL",
        },
        {
            "<leader>rl",
            function()
                repl_send_lines("visual_lines")
            end,
            mode = { 'v' },
            ft = { "lua", "python" },
            silent = true,
            desc = "Run lines on REPL",
        },
    }
}
