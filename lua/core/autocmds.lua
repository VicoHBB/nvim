local autocmd = vim.api.nvim_create_autocmd
local core_group = vim.api.nvim_create_augroup("core_autocmds", { clear = true })
local keyset = vim.keymap.set

local output_buffers = { "qf", "OverseerOutput", "toggleterm" }
local text_buffers = { "gitcommit", "markdown", "org", "tex", "text" }
local buftypes_with_cc = { "", "help" }

-- Remove spaces in the final of the line after write a file
autocmd({ "BufWritePre" }, {
    group = core_group,
    callback = function()
        local view = vim.fn.winsaveview()     -- Keep the cursor position
        vim.cmd([[keeppatterns %s/\s\+$//e]]) -- 'keeppatterns' avoid to modify history
        vim.fn.winrestview(view)              -- Restore position
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
autocmd({ "BufWritePre" }, {
    group = core_group,
    callback = function(event)
        if event.match:match("^%w%w+:[\\/][\\/]") then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- close some filetypes with <q>; scheduled so it overrides whatever the ftplugin maps
autocmd("FileType", {
    group = core_group,
    pattern = {
        "qf",
        "help",
        "man",
        "notify",
        "lspinfo",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "PlenaryTestPopup",
        "marker-groups",
        "checkhealth",
        "dap-float",
        "gitsigns-blame",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.schedule(function()
            keyset("n", "q", function()
                vim.cmd("close")
                pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
            end, {
                buffer = event.buf,
                silent = true,
                desc = "Quit buffer",
            })
        end)
    end,
})

autocmd("FileType", {
    group = core_group,
    pattern = "help",
    command = "wincmd H", -- Move the help window to the far left
})

-- Indent for output-like buffers (qf/OverseerOutput/toggleterm); wrap only for toggleterm
autocmd("FileType", {
    group = core_group,
    pattern = output_buffers,
    callback = function(event)
        vim.bo[event.buf].tabstop     = 2
        vim.bo[event.buf].softtabstop = 2
        vim.bo[event.buf].expandtab   = true
        vim.bo[event.buf].shiftwidth  = 2
        vim.opt_local.wrap = event.match == "toggleterm"
    end,
})

-- Indent + wrap-at-textwidth for text buffers; help excluded, its modeline overrides these anyway
autocmd("FileType", {
    group = core_group,
    pattern = text_buffers,
    callback = function(event)
        vim.bo[event.buf].tabstop     = 2
        vim.bo[event.buf].softtabstop = 2
        vim.bo[event.buf].expandtab   = true
        vim.bo[event.buf].shiftwidth  = 2
        vim.bo[event.buf].textwidth   = 120
        vim.opt_local.formatoptions:append("t") -- Auto-wrap at textwidth while typing
    end,
})

-- colorcolumn mirrors textwidth via "+1" (Neovim/virtcolumn resolve it live) for real buffers and help;
-- everything else is actively cleared, since virtcolumn.nvim caches it per-window and leaks into new splits.
-- BufWinEnter+schedule, not FileType: window-local, and Neogit/:terminal set buftype/filetype too late.
autocmd("BufWinEnter", {
    group = core_group,
    callback = function(event)
        local win = vim.api.nvim_get_current_win()
        vim.schedule(function()
            if not vim.api.nvim_win_is_valid(win) then
                return
            end
            local buftype = vim.bo[event.buf].buftype
            local cc_val = vim.tbl_contains(buftypes_with_cc, buftype) and "+1" or ""
            vim.api.nvim_set_option_value("colorcolumn", cc_val, { win = win })
        end)
    end,
})

-- Show CWD
autocmd({ "DirChanged" }, {
    group = core_group,
    callback = function()
        vim.cmd('pwd')
    end,
})

-- Highlight on yank
autocmd("TextYankPost", {
    group = core_group,
    callback = function()
        (vim.hl or vim.highlight).on_yank()
    end,
})

-- Reload the file when it changed outside of nvim
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = core_group,
    callback = function()
        if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
        end
    end,
})

-- Go to last cursor location when opening a buffer
autocmd("BufReadPost", {
    group = core_group,
    callback = function(event)
        local exclude = { "gitcommit" }
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].core_last_loc then
            return
        end
        vim.b[buf].core_last_loc = true
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Resize splits if window got resized
autocmd({ "VimResized" }, {
    group = core_group,
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})
