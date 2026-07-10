return {
    'kosayoda/nvim-lightbulb',
    enabled = true,
    event = 'LspAttach',
    config = function()
        require("nvim-lightbulb").setup({
            priority = 40,
            autocmd = {
                enabled = true,
                updatetime = 10,
                events = { "CursorHold", "CursorHoldI" },
            },
            sign = {
                enabled = true,
                -- Text to show in the sign column.
                -- Must be between 1-2 characters.
                text = " ",
                lens_text = " ",
                -- Highlight group to highlight the sign column text.
                hl = "LightBulbSign",
            },
            number = {
                enabled = true,
                -- Highlight group to highlight the number column if there is a lightbulb.
                hl = "LightBulbNumber",
            },
        })
    end
}

