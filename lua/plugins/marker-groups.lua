return {
    "jameswolensky/marker-groups.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",     -- Required
    },
    cmd = {
        "MarkerAdd",
        "MarkerEdit",
        "MarkerList",
        "MarkerRemove",
        "MarkerGroupsCreate",
        "MarkerGroupsSelect",
        "MarkerGroupsList",
        "MarkerGroupsRename",
        "MarkerGroupsDelete",
        "MarkerGroupsView",
        "MarkerGroupsInfo",
        "MarkerGroupsCloseDrawer",
        "MarkerGroupsDrawerWidth",
        "MarkerGroupsPickerStatus",
    },
    config = function()
        require("marker-groups").setup({
            -- Default picker is 'vim' (built-in vim.ui)
            -- Accepted values: 'vim' | 'snacks' | 'fzf-lua' | 'mini.pick' | 'telescope'
            picker = 'fzf-lua',
        })
    end,
    keys = {
        { "<leader>ma",  mode = { "n", "v" }, desc = "Add marker" },
        { "<leader>me",  desc = "Edit marker at cursor" },
        { "<leader>md",  desc = "Delete marker at cursor" },
        { "<leader>ml",  desc = "List markers in buffer" },
        { "<leader>mi",  desc = "Show marker at cursor" },
        { "<leader>mtg", desc = "Open picker for marker groups" },
        { "<leader>mtm", desc = "Open picker for markers" },
        { "<leader>mgc", desc = "Create marker group" },
        { "<leader>mgs", desc = "Select marker group" },
        { "<leader>mgl", desc = "List marker groups" },
        { "<leader>mgr", desc = "Rename marker group" },
        { "<leader>mgd", desc = "Delete marker group" },
        { "<leader>mgi", desc = "Show active group info" },
        { "<leader>mgb", desc = "Create group from git branch" },
        { "<leader>mv",  desc = "Toggle drawer marker viewer" },
    },
}
