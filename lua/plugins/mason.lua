return {
    "williamboman/mason.nvim",
    enabled = true,
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    -- cmd = { "Mason", "MasonUpdate" },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local function package_list()
            local packages

            local packages_win32 = {
                "lua_ls",
                "clangd",
                "pyright",
                "pylsp",
                "marksman",
                "lemminx",
                "ltex-ls"
            }

            local packages_unix = {
                "lua_ls",
                "clangd",
                "cmake",
                "neocmake",
                "pyright",
                "pylsp",
                "marksman",
                "verible",
                "svls",
                "textlsp"
            }

            if Is_Not_Win32 then
                packages = packages_unix
            else
                packages = packages_win32
            end

            return packages
        end

        require("mason").setup({
            ui = {
                -- Whether to automatically check for new versions
                -- when opening the :Mason window.
                check_outdated_packages_on_open = true,

                -- The border to use for the UI window.
                -- Accepts same border values as |nvim_open_win()|.
                border = "rounded",

                -- Width of the window. Accepts:
                -- - Integer greater than 1 for fixed width.
                -- - Float in the range of 0-1 for a percentage of screen width.
                width = 0.8,

                -- Height of the window. Accepts:
                -- - Integer greater than 1 for fixed height.
                -- - Float in the range of 0-1 for a percentage of screen height.
                height = 0.9,

                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        require("mason-lspconfig").setup({
            ensure_installed = package_list(),
            automatic_installation = false,
        })
    end,
}
