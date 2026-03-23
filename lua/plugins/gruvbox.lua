return {
    "ellisonleao/gruvbox.nvim",
    enabled = false,
    priority = 1000,
    opts = {
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
            strings = true,
            emphasis = true,
            comments = true,
            operators = true,
            folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {
            SignColumn = {
                bg = "#1d2021",
                -- bg = "#161616",
                -- link = "Normal"
            },
        },
        dim_inactive = true,
        transparent_mode = false,
    },
    config = function (_, opts)
        require("gruvbox").setup(opts)
        -- [[ Set colorscheme ]]
        vim.cmd.colorscheme("gruvbox")
    end
}
