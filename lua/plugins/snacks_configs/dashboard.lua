local M = {}
local fzf = require('fzf-lua')

local function set_web_devicons(name, cat)
    -- stylua: ignore
    local try = {
        function()
            if cat == "directory" then
                return "󰉋 ", "Directory"
            end
            return require("nvim-web-devicons").get_icon(name)
        end,
        -- function() return require("mini.icons").get(cat or "file", name) end,
    }
    for _, fn in ipairs(try) do
        local ok, icon, hl = pcall(fn)
        if ok then
            return { icon, hl = hl, width = 2 }
        end
    end
    return { " ", hl = "icon", width = 2 }
end

M.opt = {
    enabled = true,
    preset = {
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        -- Used by the `keys` section to show keymaps.
        -- Set your custom keymaps here.
        -- When using a function, the `items` argument are the default keymaps.
        ---@type snacks.dashboard.Item[]
        keys = {
            {
                icon = " ",
                key = "e",
                desc = "New File",
                action = "<CMD>ene | startinsert<CR>",
            },
            -- {
            --   key = "P",
            --   icon = "",
            --   desc = "Projects",
            --   action = "<CMD>Telescope projects<CR>",
            -- },
            {
                icon = " ",
                key = "<Space>fo",
                desc = "Complete History",
                action = fzf.oldfiles,
            },
            {
                icon = " ",
                key = "<Space>ff",
                desc = "Find Files",
                action = fzf.files,
            },
            {
                icon = " ",
                key = "<Space>F",
                desc = "File Browser",
                action = function()
                    require("tfm").select_file_manager("yazi")
                    vim.cmd("Tfm")
                end,
            },
            {
                icon = " ",
                key = "<Space>S",
                desc = "Find Text",
                action = fzf.live_grep,
            },
            {
                icon = " ",
                key = "N",
                desc = "Neovim News",
                action = function()
                    Snacks.win({
                        file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
                        width = 0.6,
                        height = 0.6,
                        border = "rounded",
                        wo = {
                            spell = false,
                            wrap = false,
                            signcolumn = "yes",
                            statuscolumn = " ",
                            conceallevel = 3,
                        },
                    })
                end,
            },
            {
                icon = "󰒲 ",
                key = "L",
                desc = "Lazy",
                action = "<CMD>Lazy<CR>",
                enabled = package.loaded.lazy ~= nil,
            },
            {
                icon = "󰟾",
                key = "M",
                desc = "Mason",
                action = "<CMD>Mason<CR>",
            },
            {
                icon = "󰀯 ",
                key = "ch",
                desc = "Checkhealth",
                action = "<CMD>checkhealth<CR>",
            },
            {
                icon = " ",
                key = "cc",
                desc = "Config",
                action = function()
                    fzf.files({
                        cwd = vim.fn.stdpath('config'),
                    })
                end
            },
            {
                icon = " ",
                key = "q",
                desc = "Quit",
                action = "<CMD>qall!<CR>",
            },
        },
        -- Used by the `header` section
        header = [[
                            

███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
 Welcome 
                            
I'm more what I think of my self, I really have to be...
]],

    },
    formats = {
        icon = function(item)
            if item.file and item.icon == "file" or item.icon == "directory" then
                -- return M.icon(item.file, item.icon)
                return set_web_devicons(item.file, item.icon)
            end
            return { item.icon, width = 2, hl = "icon" }
        end,
    },

    sections = {
        { section = "header" },
        {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
                return Snacks.git.get_root() ~= nil
            end,
            -- cmd = "git status --short --branch --renames",
            cmd = "git --no-pager diff --stat -B -M -C",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
        },
        {
            pane = 2,
            icon = " ",
            title = "Recent Files",
            section = "recent_files",
            indent = 2,
            padding = 1,
        },
        {
            pane = 2,
            icon = " ",
            title = "Projects",
            section = "projects",
            indent = 2,
            padding = 1,
        },
        {
            section = "keys",
            gap = 0.9,
            padding = 1,
        },
        {
            section = "startup",
        },
    },

}

return M
