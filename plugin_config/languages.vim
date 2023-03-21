lua << EOF

    require("lspsaga").setup({}) -- lspsaga

    require("nvim-lsp-installer").setup{
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
      ui = {
          icons = {
              server_installed = "✓",
              server_pending = "➜",
              server_uninstalled = "✗"
          }
      }
    }

    require'lspconfig'.clangd.setup{
        capabilities = capabilities,
    }
    --require'lspconfig'.ccls.setup{}
    require'lspconfig'.pyright.setup{
        capabilities = capabilities,
    }
    require'lspconfig'.texlab.setup{
        capabilities = capabilities,
        filetypes    = { "tex", "plaintex", "bib" }
    }
    require'lspconfig'.marksman.setup{
        capabilities = capabilities,
    }
    require'lspconfig'.asm_lsp.setup{
        capabilities = capabilities,
    }
    require'lspconfig'.svlangserver.setup{
        capabilities = capabilities,
        filetypes = { "vhdl", "verilog", "systemverilog", "verilog_systemverilog" },
    }
    require'lspconfig'.svls.setup{
        capabilities = capabilities,
        cmd = { "svls", "-d" },
        filetypes = { "vhdl", "verilog", "systemverilog", "verilog_systemverilog" },
    }
---    require('lspconfig').grammarly.setup{
---        filetypes = { "markdown" },
---    }

    require('lspconfig')['rust_analyzer'].setup{
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
        -- Server-specific settings...
        settings = {
            ["rust-analyzer"] = {
                assist = {
                  importEnforceGranularity = true,
                  importPrefix = "crate"
                  },
                cargo = {
                  allFeatures = true
                  },
                checkOnSave = {
                  -- default: `cargo check`
                  command = "cargo check"
                  },
                inlayHints = {
                  lifetimeElisionHints = {
                    enable = true,
                    useParameterNames = true
                  },
                },
            }
        }
    }

EOF

