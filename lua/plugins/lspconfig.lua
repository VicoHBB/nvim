return {
    'neovim/nvim-lspconfig',                                        -- Config
    priority = 1000,
    config = function()

      require('lspconfig').clangd.setup{
        capabilities = capabilities,
        filetypes    = { "c", "cpp" },
      }

      -- require('lspconfig').ccls.setup {
      --   init_options = {
      --     compilationDatabaseDirectory = "build";
      --     index = {
      --       threads = 0;
      --     };
      --     clang = {
      --       excludeArgs = { "-frounding-math"} ;
      --     };
      --   }
      -- }

      require('lspconfig').cmake.setup{
      }

      require('lspconfig').pyright.setup{
        capabilities = capabilities,
      }

      require('lspconfig').pylsp.setup{
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                --ignore = {'W391'},
                maxLineLength = 80
              }
            }
          }
        }
      }

      require('lspconfig').texlab.setup{
        capabilities = capabilities,
        filetypes    = { "tex", "plaintex", "bib" },
      }

      require('lspconfig').ltex.setup{
        settings = {
          ltex = {
            language = "en-US",
            -- language = "es",
            dictionary = {
              ['en-GB'] = {
                "MicroPython",
                "AUTOSAR",
              },
              ['es'] = {
                "MicroPython",
                "AUTOSAR",
              },
            },
          },
        },
      }

      require('lspconfig').marksman.setup{
        cmd = { "marksman", "server" },
        capabilities = capabilities,
      }

      -- require('lspconfig').grammarly.setup{
      -- 	filetypes = {"markdown"}
      -- }

      require('lspconfig').asm_lsp.setup{
        capabilities = capabilities,
      }

      require('lspconfig').svlangserver.setup{
        capabilities = capabilities,
        filetypes = { "vhdl", "verilog", "systemverilog", "verilog_systemverilog" },
      }

      require('lspconfig').svls.setup{
        capabilities = capabilities,
        cmd = { "svls", "-d" },
        filetypes = { "vhdl", "verilog", "systemverilog", "verilog_systemverilog" },
      }

      require('lspconfig').vimls.setup{
        cmd = { "vim-language-server", "--stdio" },
        filetypes = { "vim" }
      }

      require('lspconfig').lua_ls.setup {
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {'vim'},
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but
            -- unique identifier
            telemetry = {
              enable = true,
            },
          },
        },
      }

      -- require'lspconfig'.grammarly.setup{
      --   filetypes    = { "markdown", "tex" },
      -- }

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

    end,
}
