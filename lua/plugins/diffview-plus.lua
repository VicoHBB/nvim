return {
    -- "sindrets/diffview.nvim",
    "dlyongemallo/diffview-plus.nvim",
    enabled = true,
    version = "*",
    cmd = {
        "DiffviewOpen",
        "DiffviewToggle",
        "DiffviewFileHistory",
        "DiffviewDiffFiles",
        "DiffviewLog",
    },
    -- No setup() call: diffview works with its defaults and this spec has no opts
    config = function()
        local autocmd = vim.api.nvim_create_autocmd
        local diffview_group = vim.api.nvim_create_augroup("diffview_autocmds", { clear = true })
        local keyset = vim.keymap.set

        -- Close Diffviews with <q>
        autocmd("FileType", {
            group = diffview_group,
            pattern = {
                "DiffviewFiles",
                "DiffviewFileHistory",
            },
            callback = function(event)
                keyset("n", "q", function()
                        require("diffview").close()
                    end,
                    {
                        buffer = event.buf,
                        silent = true
                    }
                )
            end,
        })
    end,
    keys = {
        {
            "<leader>gD",
            function()
                vim.cmd("DiffviewOpen --untracked-files")
            end,
            mode = { "n" },
            silent = true,
            desc = "Git Diff"
        },
        {
            "<leader>gh",
            function()
                vim.cmd("DiffviewFileHistory %")
            end,
            mode = { "n" },
            silent = true,
            desc = "Git Diff File History"
        },
    }
}
