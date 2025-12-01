return {
    'andymass/vim-matchup',
    enabled = true,
    init = function()
        local group = vim.api.nvim_create_augroup("matchup_matchparen_highlight", { clear = true })

        vim.api.nvim_create_autocmd("ColorScheme", {
            group = group,
            pattern = "*",
            command = "hi MatchParen guifg=red guibg=0",
        })
        -- modify your configuration vars here
        vim.g.matchup_treesitter_stopline = 500
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
        vim.g.loaded_matchit = 1
    end,
    opts = {
        treesitter = {
            stopline = 500,
        }
    }
}
