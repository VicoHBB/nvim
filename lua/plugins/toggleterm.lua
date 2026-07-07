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

-- File managers (replaces tfm.nvim): each builds the command that makes the
-- file manager write its selection to the chooser file on exit
local file_managers = {
    Yazi = function(chooser)
        local current = vim.fn.expand("%:p")
        current = current ~= "" and vim.fn.shellescape(current) or ""
        return ("yazi %s --chooser-file=%s"):format(current, chooser)
    end,
    ViFm = function(chooser)
        return ("vifm --choose-files %s %s"):format(chooser, vim.fn.shellescape(vim.fn.expand("%:p:h")))
    end,
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
    if not repl then
        return
    end
    vim.cmd(repl.count .. "TermExec cmd='" .. interpreters[ft].run .. "'")
end

local function repl_send_lines(selection_type)
    local ft = vim.bo.filetype
    local repl = get_repl(ft, true)
    if not repl then
        return
    end
    require("toggleterm").send_lines_to_terminal(selection_type, interpreters[ft].trim, { args = repl.count })
end

-- Float the file manager and open whatever it selected in the current window;
-- a fresh terminal per invocation because the chooser file is unique each time
local function open_file_manager(name)
    local chooser = vim.fn.tempname()
    local Terminal = require('toggleterm.terminal').Terminal

    Terminal:new({
        cmd = file_managers[name](chooser),
        direction = "float",
        close_on_exit = true,
        on_exit = function()
            vim.schedule(function()
                if vim.fn.filereadable(chooser) == 1 then
                    for _, file in ipairs(vim.fn.readfile(chooser)) do
                        if file ~= "" then
                            vim.cmd.edit(vim.fn.fnameescape(file))
                        end
                    end
                    vim.fn.delete(chooser)
                end
            end)
        end,
    }):open()
end

return {
    'akinsho/toggleterm.nvim',
    enabled = Is_Not_Win32,
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
        local cmd = vim.api.nvim_create_user_command

        -- Like :REPL below, these exist without loading the plugin (it loads on first use)
        for name in pairs(file_managers) do
            cmd(name, function()
                open_file_manager(name)
            end, {
                nargs = 0,
                desc = "Open " .. name
            })
        end

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
        {
            "<leader>F",
            function()
                vim.cmd("Yazi")
            end,
            mode = { 'n' },
            silent = true,
            desc = "Open Yazi",
        },
    }
}
