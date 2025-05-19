return {
    'neovim/nvim-lspconfig',
    enabled = true,
    dependencies = {
        "williamboman/mason.nvim",
        enabled = true,
        {
            "hasansujon786/nvim-navbuddy",
            dependencies = {
                "SmiteshP/nvim-navic",
                -- "MunifTanjim/nui.nvim"
                {
                    -- @TODO: This is a partial solution
                    "pynappo/nui.nvim",
                    branch = "support-winborder"
                },
            },
            opts = {
                lsp = {
                    auto_attach = true,
                },
            }
        }
    },
    priority = 1000,
    config = function()
        local lsp = require("lspconfig")
        local lspconfig_defaults = require('lspconfig').util.default_config
        local blink_cmp = require('blink.cmp')


        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            lspconfig_defaults.capabilities,
            vim.lsp.protocol.make_client_capabilities(),
            blink_cmp.get_lsp_capabilities()
        )


        local function lsp_action(cmd)
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            local client_names = {}

            -- get name from each client and append n to a new table
            for _, client in ipairs(clients) do
                table.insert(client_names, client.name)
            end

            if cmd == "LspStop" then
                vim.notify("Stopping" .. " " .. table.concat(client_names, " "))
            elseif cmd == "LspStart" then
                vim.notify("Starting" .. " " .. table.concat(client_names, " "))
            elseif cmd == "LspRestart" then
                vim.notify("Restarting" .. " " .. table.concat(client_names, " "))
            else
                vim.notify("Invalid command: " .. cmd)
            end

            vim.cmd(cmd .. " " .. table.concat(client_names, " "))
        end

        local on_attach = function(_, bufnr)
            local fzf = require("fzf-lua")
            local keyset = vim.keymap.set

            -- Rename
            keyset('n', "<leader>R", function()
                    vim.lsp.buf.rename()
                    vim.cmd("wall")
                end,
                {
                    silent = true,
                    desc   = "Rename",
                    buffer = bufnr,
                }
            )
            -- Code Action
            keyset('n', "<leader>a", fzf.lsp_code_actions,
                {
                    silent = true,
                    desc   = "Code Action",
                    buffer = bufnr,
                }
            )
            -- Move diag shortcut
            keyset('n', "<leader>[",
                function()
                    vim.diagnostic.jump({ count = -1, float = true })
                end,
                {
                    silent = true,
                    desc   = "Jump the to Previous Dx",
                    buffer = bufnr,
                }
            )
            keyset('n', "<leader>]",
                function()
                    vim.diagnostic.jump({ count = 1, float = true })
                end,
                {
                    silent = true,
                    desc   = "Jump the to Next Dx",
                    buffer = bufnr,
                }
            )
            keyset('n', "[d",
                function()
                    vim.diagnostic.jump({ count = -1, float = true })
                end,
                {
                    silent = true,
                    desc   = "Jump the to Previous Dx",
                    buffer = bufnr,
                }
            )
            keyset('n', "]d",
                function()
                    vim.diagnostic.jump({ count = 1, float = true })
                end,
                {
                    silent = true,
                    desc   = "Jump the to Next Dx",
                    buffer = bufnr,
                }
            )
            keyset('n', '<leader>?', vim.diagnostic.setqflist,
                {
                    desc   = "Show Dx",
                    silent = true,
                    buffer = bufnr,
                }
            )
            -- GoTo
            keyset("n", "gd", function()
                    fzf.lsp_definitions()
                    vim.cmd("normal zz")
                end,
                {
                    desc   = "Go to definitions",
                    silent = true,
                    buffer = bufnr,
                }
            )
            keyset("n", "gD", function()
                    vim.lsp.buf.declaration()
                    vim.cmd("normal zz")
                end,
                {
                    desc   = "Go to Declaration",
                    silent = true,
                    buffer = bufnr,
                }
            )
            keyset("n", "gr", function()
                    fzf.lsp_references()
                    vim.cmd("normal zz")
                end,
                {
                    desc   = "Go to References",
                    silent = true,
                    buffer = bufnr,
                }
            )
            keyset("n", "gt", function()
                    fzf.lsp_typedefs()
                    vim.cmd("normal zz")
                end,
                {
                    desc   = "Go to Type Definitions",
                    silent = true,
                    buffer = bufnr,
                }
            )
            keyset("n", "gI", function()
                    fzf.lsp_implementations()
                    vim.cmd("normal zz")
                end,
                {
                    desc   = "Go to Implementataion",
                    silent = true,
                    buffer = bufnr,
                }
            )
            keyset("n", "gF", function()
                    fzf.lsp_finder()
                    vim.cmd("normal zz")
                end,
                {
                    desc   = "Go to Finder",
                    silent = true,
                    buffer = bufnr,
                }
            )
            keyset("n", "gci", function()
                    fzf.lsp_incoming_calls()
                    vim.cmd("normal zz")
                end,
                {
                    desc   = "Go to Incoming Calls",
                    silent = true,
                    buffer = bufnr,
                }
            )
            keyset("n", "gco", function()
                    fzf.lsp_outgoing_calls()
                    vim.cmd("normal zz")
                end,
                {
                    desc   = "Go to Outgoing Calls",
                    silent = true,
                    buffer = bufnr,
                }
            )
            keyset("n", "K", require("noice.lsp").hover,
                {
                    buffer = bufnr,
                    silent = true,
                    desc   = "Hover Documentation",
                }
            )

            keyset("n", "gK", require("noice.lsp").signature,
                {
                    buffer  = bufnr,
                    noremap = true,
                    silent  = true,
                    desc    = "Show Signature",
                }
            )

            keyset({ "n", "i", "s" }, "<c-f>", function()
                if not require("noice.lsp").scroll(4) then
                    return "<c-f>"
                end
            end, {
                silent = true,
                expr = true,
                desc = "Scroll down",
            }
            )

            keyset({ "n", "i", "s" }, "<c-b>", function()
                    if not require("noice.lsp").scroll(-4) then
                        return "<c-b>"
                    end
                end,
                {
                    silent = true,
                    expr   = true,
                    desc   = "Scroll up",
                }
            )

            -- Navbudy
            keyset('n', "<leader>n", require('nvim-navbuddy').open,
                {
                    silent = true,
                    desc   = "Navigate trough symbols",
                }
            )
            -- Format
            keyset({ 'v', 'x' }, '<leader>f', function()
                    vim.lsp.buf.format { async = true }
                end,
                {
                    buffer = bufnr,
                    silent = true,
                    desc   = "Format",
                }
            )
            -- Restart lsp stop
            keyset({ 'n' }, '<leader>LS', function()
                    lsp_action("LspStop")
                end,
                {
                    buffer = bufnr,
                    silent = true,
                    desc   = "Stop all lsp client attached to the buffer",
                }
            )
            -- Restart lsp start
            keyset({ 'n' }, '<Space>Ls', function()
                    lsp_action("LspStart")
                end,
                {
                    buffer = bufnr,
                    silent = true,
                    desc   = "Stop all lsp client attached to the buffer",
                }
            )
            -- Restart lsp manually
            keyset({ 'n' }, '<Space>Lr', function()
                    lsp_action("LspRestart")
                end,
                {
                    buffer = bufnr,
                    silent = true,
                    desc   = "Restart all lsp client attached to the buffer",
                }
            )
        end

        lsp.lua_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {},
        })


        lsp.clangd.setup({
            on_attach    = on_attach,
            capabilities = capabilities,
            filetypes    = { "c", "cpp" },
        })

        lsp.cmake.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = lsp.util.root_pattern(
                'CMakePresets.json',
                'CTestConfig.cmake',
                '.git',
                'build',
                'cmake',
                'compile_commands.json'
            )
        })

        lsp.neocmake.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = lsp.util.root_pattern(
                '.git',
                'cmake',
                'compile_commands.json'
            ),
        })

        lsp.verible.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = {
                'verible-verilog-ls',
                '--rules_config_search',
                '--indentation_spaces=4'
            },
            filetypes = { "vhdl", "verilog", "systemverilog" },
            root_dir = lsp.util.root_pattern(
                '.git',
                '.gitignore',
                '.rules.verible_lint',
                'verible.filelist'
            )
        })

        -- lsp.svlangserver.setup({
        --   on_attach = on_attach,
        --   capabilities = capabilities,
        --   filetypes = { "vhdl", "verilog", "systemverilog" },
        --   root_dir = lsp.util.root_pattern(
        --     '.git',
        --     '.gitignore',
        --     '.svlint.toml',
        --     '.svls.toml'
        --   )
        -- })

        lsp.svls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { "svls", "-d" },
            filetypes = { "vhdl", "verilog", "systemverilog" },
            root_dir = lsp.util.root_pattern(
                '.git',
                '.gitignore',
                '.svlint.toml',
                '.svls.toml'
            )
        })

        lsp.pyright.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                python = {
                    -- @TODO: Check this, I think is not the best way to do it
                    pythonPath = vim.fn.getcwd() .. "/.venv/bin/python",
                    analysis = {
                        extraPaths = { "src", "tests" },
                        autoSearchPaths = true,
                        diagnosticMode = "openFilesOnly",
                        useLibraryCodeForTypes = true
                    }
                }
            },
        })

        -- @TODO: Check Ruff
        lsp.ruff.setup{
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
          }
        }


        lsp.marksman.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- To support org files
        vim.cmd [[
      autocmd BufRead,BufNewFile *.org set filetype=org
      ]]

        lsp.texlab.setup({
            capabilities = capabilities,
            on_attach    = on_attach,
            filetypes    = { "tex", "plaintex", "bib" },
            root_dir     = lsp.util.root_pattern(
                'References',
                'main'
            )
        })

        -- lsp.ltex.setup({
        --   on_attach = on_attach,
        --   capabilities = capabilities,
        --   filetypes = {
        --     "bib",
        --     "gitcommit",
        --     "markdown",
        --     "org",
        --     "plaintex",
        --     "rst",
        --     "rnoweb",
        --     "tex",
        --     "pandoc",
        --     "quarto",
        --     "rmd",
        --     "context",
        --     "html",
        --     "xhtml",
        --     "mail",
        --     "text"
        --   },
        --   settings = {
        --     ltex = {
        --       language = "en-US",
        --     },
        --   },
        -- })

        -- lsp.textlsp.setup({
        --     on_attach = on_attach,
        --     capabilities = capabilities,
        --     filetypes = {
        --         "bib",
        --         -- "gitcommit",
        --         "markdown",
        --         "org",
        --         "tex",
        --         "text"
        --     },
        --     settings = {
        --         textDocument = {
        --             analysers = {
        --                 languagetool = {
        --                     check_text = {
        --                         on_change = false,
        --                         on_open = false,
        --                         on_save = true
        --                     },
        --                     enabled = true
        --                 }
        --             },
        --             documents = {
        --                 language = "auto:en",
        --                 org = {
        --                     org_todo_keywords = { "TODO", "IN_PROGRESS", "DONE" }
        --                 }
        --             }
        --         },
        --     },
        -- })

        -- ============================================================================
        -- Not use to much
        -- ============================================================================

        -- lsp.vimls.setup({
        --     on_attach = on_attach,
        --     capabilities = capabilities,
        -- })

        lsp.jsonls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- lsp.lemminx.setup({
        --     on_attach = on_attach,
        --     capabilities = capabilities,
        -- })

        -- lsp.bashls.setup({
        --   on_attach = on_attach,
        --   capabilities = capabilities,
        --   filetypes = { "sh", "bash", "zsh" },
        -- })

        -- lsp.asm_lsp.setup({
        --   on_attach = on_attach,
        --   capabilities = capabilities,
        -- })

        -- lsp['rust_analyzer'].setup({
        --   capabilities = capabilities,
        --   on_attach = on_attach,
        --   flags = lsp_flags,
        --   -- Server-specific settings...
        --   settings = {
        --     ["rust-analyzer"] = {
        --       assist = {
        --         importEnforceGranularity = true,
        --         importPrefix = "crate"
        --       },
        --       cargo = {
        --         allFeatures = true
        --       },
        --       checkOnSave = {
        --         -- default: `cargo check`
        --         command = "cargo check"
        --       },
        --       inlayHints = {
        --         lifetimeElisionHints = {
        --           enable = true,
        --           useParameterNames = true
        --         },
        --       },
        --     }
        --   }
        -- })
    end,
}
