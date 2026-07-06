local autocmd = vim.api.nvim_create_autocmd
local core_group = vim.api.nvim_create_augroup("core_autocmds", { clear = true })
local keyset = vim.keymap.set
Initial_Dir = vim.fn.getcwd()

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
    command = "wincmd H", -- Mueve la ventana de ayuda a la derecha
})

-- Settings for output-like buffers (terminal, task output, quickfix); replaces
-- the identical ftplugin/{qf,OverseerOutput,toggleterm}.lua files
autocmd("FileType", {
    group = core_group,
    pattern = { "qf", "OverseerOutput", "toggleterm" },
    callback = function(event)
        vim.bo[event.buf].tabstop     = 2
        vim.bo[event.buf].softtabstop = 2
        vim.bo[event.buf].expandtab   = true
        vim.bo[event.buf].shiftwidth  = 2
        vim.wo.colorcolumn = "0"
        vim.opt_local.wrap = event.match == "toggleterm"
    end,
})

-- Define autocommands to enable the command for specific file types
-- add_cmd('FileType', {
--   pattern = { 'txt', 'markdown', 'org', 'tex' },
--   callback = commands.ltexedit
-- })

-- Show CWD
autocmd({ "DirChanged" }, {
    group = core_group,
    callback = function()
        vim.cmd('pwd')
    end,
})

autocmd("VimEnter", {
    group = core_group,
    once = true,
    callback = function()
        Initial_Dir = vim.fn.getcwd()
    end,
})

vim.api.nvim_create_user_command("PrintInitialDir", function()
    vim.notify(tostring(Initial_Dir), vim.log.levels.INFO)
end, {})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
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
