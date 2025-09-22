local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = function(event)

        -- Set capabilities when LSP attaches for autocompletion
        vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
        })

        local keyset = function(mode, keys, func, desc)
            vim.keymap.set(
                mode,
                keys,
                func,
                {
                    silent = true,
                    buffer = event.buf,
                    desc = "LSP -> " .. desc
                }
            )
        end
        local fzf = require("fzf-lua")

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

        keyset('n', "<leader>R", function()
                vim.lsp.buf.rename()
                vim.cmd("wall")
            end,
            "[R]ename"
        )
        keyset('n', "<leader>a", fzf.lsp_code_actions,
            "Code [A]ction"
        )
        -- Move diag shortcut
        keyset('n', "<leader>[",
            function()
                vim.diagnostic.jump({ count = -1, float = true })
            end,
            "Previous Dx"
        )
        keyset('n', "<leader>]",
            function()
                vim.diagnostic.jump({ count = 1, float = true })
            end,
            "Next Dx"
        )
        keyset('n', "[d",
            function()
                vim.diagnostic.jump({ count = -1, float = true })
            end,
            "Previous Dx"
        )
        keyset('n', "]d",
            function()
                vim.diagnostic.jump({ count = 1, float = true })
            end,
            "Next Dx"
        )
        keyset('n', '<leader>?', vim.diagnostic.setqflist,
            "Show Dx"
        )
        -- GoTo
        keyset("n", "gd", function()
                fzf.lsp_definitions()
                vim.cmd("normal zz")
            end,
            "[G]o to [D]efinitions"
        )
        keyset("n", "gD", function()
                vim.lsp.buf.declaration()
                vim.cmd("normal zz")
            end,
            "[G]o to [D]eclaration"
        )
        keyset("n", "gr", function()
                fzf.lsp_references()
                vim.cmd("normal zz")
            end,
            "[G]o to [R]eferences"
        )
        keyset("n", "gt", function()
                fzf.lsp_typedefs()
                vim.cmd("normal zz")
            end,
            "[G]o to [T]ype Definitions"
        )
        keyset("n", "gI", function()
                fzf.lsp_implementations()
                vim.cmd("normal zz")
            end,
            "[G]o to [I]mplementataion"
        )
        keyset("n", "gF", function()
                fzf.lsp_finder()
                vim.cmd("normal zz")
            end,
            "[G]o to [F]inder"

        )
        keyset("n", "gci", function()
                fzf.lsp_incoming_calls()
                vim.cmd("normal zz")
            end,
            "[G]o to [I]ncoming [C]alls"

        )
        keyset("n", "gco", function()
                fzf.lsp_outgoing_calls()
                vim.cmd("normal zz")
            end,
            "[G]o to [O]utgoing [C]alls"

        )
        keyset("n", "K", require("noice.lsp").hover,
            "Hover Documentation"

        )

        keyset("n", "gK", require("noice.lsp").signature,
            "Show Signature"
        )

        keyset({ "n", "i", "s" }, "<c-f>", function()
                if not require("noice.lsp").scroll(4) then
                    return "<c-f>"
                end
            end,
            "Scroll down"
        )

        keyset({ "n", "i", "s" }, "<c-b>", function()
                if not require("noice.lsp").scroll(-4) then
                    return "<c-b>"
                end
            end,
            "Scroll up"
        )

        -- Navbudy
        keyset('n', "<leader>n", require('nvim-navbuddy').open,
            "Navigate trough symbols"
        )

        -- Format
        keyset({ 'v', 'x' }, '<leader>f', function()
                vim.lsp.buf.format { async = true }
                vim.notify("Format Done",vim.log.levels.INFO)
            end,
            "Format"
        )

        -- Format
        keyset({ 'v', 'x' }, '<leader>f', function()
                vim.lsp.buf.format { async = true }
                vim.notify("Format Done",vim.log.levels.INFO)
            end,
            "Format"
        )

        -- Restart lsp stop
        keyset({ 'n' }, '<leader>LS', function()
                local clients = vim.lsp.get_clients({ bufnr = 0 })
                local client_names = {}

                -- get name from each client and append n to a new table
                for _, client in ipairs(clients) do
                    table.insert(client_names, client.name)
                    client:stop()
                end

                vim.notify("Stopped LSP clients: " .. table.concat(client_names, ", "), vim.log.levels.INFO)

            end,
            "Stop all lsp client attached to the buffer"
        )

            -- Restart lsp stop
        keyset({ 'n' }, '<leader>Lk', function()
                vim.cmd("LspStop")
            end,
            "Stop all lsp client attached to the buffer"
        )

        --  Start all lsp on the buffer
        keyset({ 'n' }, '<Space>Ls', function()
                lsp_action("LspStart")
            end,
            "Stop all lsp client attached to the buffer"
        )

        -- Restart all lsp
        keyset({ 'n' }, '<Space>Lr', function()
            vim.cmd("LspRestart")
            end,
            "Restart all lsp client attached to the buffer"
        )

        -- Restart lsp manually
        -- keyset({ 'n' }, '<Space>Lr', function()
        --         lsp_action("LspRestart")
        --     end,
        --     "Restart all lsp client attached to the buffer"
        -- )

        -- @NOTE: Check this
        -- will be done with conform
        -- map("<leader>f", vim.lsp.buf.format, "[F]ormat the document")

    end,
})
