
lua << EOF
    require'lspconfig'.clangd.setup{}
    --require'lspconfig'.ccls.setup{}
    require'lspconfig'.pyright.setup{}
    require'lspconfig'.texlab.setup{}
    require'lspconfig'.marksman.setup{}

    require('lspconfig')['rust_analyzer'].setup{
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
                  command = "clippy"
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


    require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
      ui = {
          icons = {
              server_installed = "✓",
              server_pending = "➜",
              server_uninstalled = "✗"
          }
      }
    })

EOF

