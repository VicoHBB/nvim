return {
  {                          -- lspconfig
    'neovim/nvim-lspconfig', -- Config
    dependencies = {
      "williamboman/mason.nvim",
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim"
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
      local cmp_lsp = require("cmp_nvim_lsp")
      local keyset = vim.keymap.set

      -- Set up cmp.
      -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        lspconfig_defaults.capabilities,
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
      )
      -- local capabilities = require('blink.cmp').get_lsp_capabilities()
      local on_attach = function(_, bufnr)
        -- LSPSaga
        -- keyset("n", "K", "<CMD>Lspsaga hover_doc<CR>",
        --   {
        --     buffer = bufnr,
        --     silent = true,
        --     desc   = "Hover Documentation",
        --   }
        -- )
        -- Rename
        keyset('n', "<leader>R", "<CMD>Lspsaga rename<CR>",
          {
            silent = true,
            desc   = "Rename var",
          }
        )
        -- Code Action Menu
        keyset('n', "<leader>a", "<CMD>Lspsaga code_action<CR>",
          {
            silent = true,
            desc   = "Code Action",
          }
        )
        -- LSPSAGA Dx
        keyset('n', "<leader>[", "<CMD>Lspsaga diagnostic_jump_prev<CR>",
          {
            silent = true,
            desc   = "Previous Dx",
          }
        )
        keyset('n', "<leader>]", "<CMD>Lspsaga diagnostic_jump_next<CR>",
          {
            silent = true,
            desc   = "Next Dx",
          }
        )
        keyset(
          'n',
          '<leader>?',
          function() vim.diagnostic.setqflist() end,
          {
            desc   = "Show Dx",
            silent = true,
          }
        )
        -- GoTo
        keyset("n", "gd", "<CMD>Lspsaga goto_definition<CR>",
          {
            desc   = "Go to Definition",
            silent = true,
            buffer = bufnr,
          }
        )
        keyset("n", "gR", "<CMD>Lspsaga finder<CR>",
          {
            desc   = "Go to References",
            silent = true,
            buffer = bufnr,
          }
        )
        keyset("n", "gpd", "<CMD>Lspsaga peek_definition<CR>",
          {
            desc   = "Peek definition",
            silent = true,
            buffer = bufnr,
          }
        )

        -- LSP with noice
        -- keyset("n", "gK", require("noice.lsp").hover,
        --   {
        --     desc = "Hover Doc (Noice)",
        --     silent = true,
        --     buffer = bufnr,
        --   }
        -- )

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
        end, {
          silent = true,
          expr   = true,
          desc   = "Scroll up",
        }
        )

        -- Navbudy
        keyset('n', "<leader>N", "<CMD>Navbuddy<CR>",
          {
            silent = true,
            desc   = "Open NavBuddy",
          }
        )

        -- Lsp simple
        -- Format
        keyset('v', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end,
          {
            buffer = bufnr,
            silent = true,
            desc   = "Format",
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

      lsp.svlangserver.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "vhdl", "verilog", "systemverilog" },
        root_dir = lsp.util.root_pattern(
          '.git',
          '.gitignore',
          '.svlint.toml',
          '.svls.toml',
          'rtl'
        )
      })

      lsp.svls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "svls", "-d" },
        filetypes = { "vhdl", "verilog", "systemverilog" },
        root_dir = lsp.util.root_pattern(
          '.git',
          '.gitignore',
          '.svlint.toml',
          '.svls.toml',
          'rtl'
        )
      })

      lsp.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- @TODO: Check Ruff
      -- lsp.ruff.setup{
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      --   root_dir     = lsp.util.root_pattern(
      --     '.git',
      --     '.ruff.toml',
      --     'ruff.toml',
      --     'pyproject.toml'
      --   ),
      --   settings = {
      --   }
      -- }


      lsp.pylsp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
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
      })

      lsp.marksman.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "marksman", "server" },
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

      lsp.textlsp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {
          "bib",
          "gitcommit",
          "markdown",
          "org",
          "tex",
          "text"
        },
        settings = {
          textDocument = {
            analysers = {
              languagetool = {
                check_text = {
                  on_change = true,
                  on_open = true,
                  on_save = true
                },
                enabled = true
              }
            },
            documents = {
              language = "auto:en",
              org = {
                org_todo_keywords = { "TODO", "IN_PROGRESS", "DONE" }
              }
            }
          },
        },
      })

      lsp.vimls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "vim-language-server", "--stdio" },
        filetypes = { "vim" }
      })


      -- ============================================================================
      -- Not use to much
      -- ============================================================================

      lsp.jsonls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- lsp.asm_lsp.setup({
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      -- })

      -- lsp.lemminx.setup({
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
  },
  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      -- your options here
    }
  },
  -- { -- lsp-timeout
  --   "hinell/lsp-timeout.nvim",
  --   dependencies = {
  --     "neovim/nvim-lspconfig",
  --   },
  --   event = "LspAttach",
  -- },
}
