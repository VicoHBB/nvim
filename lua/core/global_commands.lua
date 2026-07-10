-- Custom commands that only use vanilla Neovim; commands that depend on a
-- plugin live in that plugin's spec
local cmd = vim.api.nvim_create_user_command

-- Side-by-side native diff of a file at two revisions (rev1 left, rev2 right):
-- scratch buffers + diffthis in their own tab, `q` closes it
local native_diff = function(rev1, rev2, rel_path)
    local show_rev = function(rev)
        local lines = vim.fn.systemlist({ "git", "show", rev .. ":" .. rel_path })
        if vim.v.shell_error ~= 0 then
            lines = {} -- root commit or file absent: diff against nothing
        end

        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
        vim.api.nvim_buf_set_name(buf, "ndiff://" .. buf .. "/" .. rev .. ":" .. rel_path)
        vim.bo[buf].bufhidden = "wipe"
        vim.bo[buf].filetype = vim.filetype.match({ filename = rel_path }) or ""
        vim.api.nvim_set_current_buf(buf)

        vim.keymap.set("n", "q", function()
            vim.cmd("tabclose")
        end, { buffer = buf, silent = true, desc = "Close diff tab" })
        vim.cmd("diffthis")
    end

    vim.cmd("tabnew")
    show_rev(rev2)
    vim.cmd("leftabove vsplit")
    show_rev(rev1)
end

cmd("PrintInitialDir", function()
        vim.notify(tostring(Initial_Dir), vim.log.levels.INFO)
    end,
    {
        nargs = 0,
        desc = "Show the dir nvim was launched from",
    }
)

cmd("NDiff", function(opts)
        local rev1, rev2, rel_path = opts.fargs[1], opts.fargs[2], opts.fargs[3]
        if #opts.fargs > 3 then
            return vim.notify("NDiff takes 1-2 revisions and an optional path", vim.log.levels.ERROR)
        end
        for _, rev in ipairs({ rev1, rev2 }) do
            vim.fn.systemlist({ "git", "rev-parse", "--verify", rev .. "^{commit}" })
            if vim.v.shell_error ~= 0 then
                return vim.notify("Not a commit: " .. rev, vim.log.levels.ERROR)
            end
        end

        -- Explicit path is trusted as repo-root-relative (mini.git range history
        -- passes the traced file, whose buffer is minigit:// and not ls-files-able)
        if not rel_path then
            rel_path = vim.fn.systemlist({ "git", "ls-files", "--full-name", "--", vim.api.nvim_buf_get_name(0) })[1]
            if vim.v.shell_error ~= 0 or not rel_path or rel_path == "" then
                return vim.notify("Current file is not tracked by git", vim.log.levels.ERROR)
            end
        end

        native_diff(rev2 and rev1 or rev1 .. "^", rev2 or rev1, rel_path)
    end,
    {
        nargs = "+",
        complete = function(arglead)
            local refs = vim.fn.systemlist({ "git", "for-each-ref", "--format=%(refname:short)" })
            if vim.v.shell_error ~= 0 then
                return {}
            end
            return vim.tbl_filter(function(ref)
                return vim.startswith(ref, arglead)
            end, refs)
        end,
        desc = "Diff current file between two revisions (one rev: rev^ vs rev)",
    }
)
