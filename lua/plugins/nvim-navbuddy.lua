return {
    "hasansujon786/nvim-navbuddy",
    enabled = true,
    dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
    },
    opts = {
        lsp = {
            auto_attach = true,
        },
        mappings = {
            -- The stock action needs Comment.nvim; same behavior with mini.comment
            -- (both scope lines and toggle_lines() are 1-indexed, no conversion)
            ["c"] = {
                callback = function(display)
                    local scope = display.focus_node.scope
                    display.state.leaving_window_for_action = true
                    vim.api.nvim_set_current_win(display.for_win)
                    require("mini.comment").toggle_lines(scope["start"].line, scope["end"].line)
                    vim.api.nvim_set_current_win(display.mid.winid)
                    display.state.leaving_window_for_action = false
                end,
                description = "Comment scope (mini.comment)",
            },
        },
    }
}
