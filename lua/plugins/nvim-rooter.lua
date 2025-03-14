return {
    'notjedi/nvim-rooter.lua',
    enabled = true,
    event = "VeryLazy",
    config = function()
        require("nvim-rooter").setup({
            -- Set the root directory to the current directory of the file
            rooter_patterns = {
                '.git',
                '.hg',
                '.svn',
                'Makefile',
                'compile_commands.json',
                'References'
            },
            trigger_patterns = { '*' },
            manual = false,
            fallback_to_parent = false,
            cd_scope = "global",
            follow_symlinks = true,
        })
    end,
    keys = {
        {
            '<leader>cd',
            "<CMD>RooterToggle<CR>",
            mode = {'n'},
            desc = "Rooter Toggle"
        }
    }
}
