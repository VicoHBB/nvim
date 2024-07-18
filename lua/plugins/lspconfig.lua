return {
  'neovim/nvim-lspconfig', -- Config
  dependencies = {
    "williamboman/mason.nvim",
    "folke/neodev.nvim",
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim"
      },
      opts = { lsp = { auto_attach = true } }
    }
  },
  priority = 1000,
  config = function()
    local cmp_lsp = require("cmp_nvim_lsp")
    local keyset = vim.keymap.set
    -- Set up cmp.
    -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )
    local on_attach = function (_, bufnr)
      -- LSPSaga
      keyset( "n", "K", "<CMD>Lspsaga hover_doc<CR>",
        {
          desc   = "Hover",
          silent = true,
          buffer = bufnr,
        }
      )
      -- Rename
      keyset( 'n', "<leader>R", "<CMD>Lspsaga rename<CR>", {silent = true} )
      -- Code Action Menu
      keyset( 'n', "<leader>a", "<CMD>Lspsaga code_action<CR>", {silent= true} )
      -- LSPSAGA Dx
      keyset( 'n', "<leader>[", "<CMD>Lspsaga diagnostic_jump_prev<CR>", {silent= true} )
      keyset( 'n', "<leader>]", "<CMD>Lspsaga diagnostic_jump_next<CR>", {silent= true} )
      keyset( 'n', "<leader>?", "<CMD>Trouble diagnostics toggle<CR>", {silent= true} )

      -- GoTo
      keyset( "n", "gd", "<CMD>Lspsaga goto_definition<CR>",
        {
          desc   = "Go to Definition",
          silent = true,
          buffer = bufnr,
        }
      )
      keyset( "n", "gr", "<CMD>Lspsaga finder<CR>",
        {
          desc   = "Go to References",
          silent = true,
          buffer = bufnr,
        }
      )
      keyset( "n", "gpd", "<CMD>Lspsaga peek_definition<CR>",
        {
          desc   = "Peek definition",
          silent = true,
          buffer = bufnr,
        }
      )

      -- LSP with noice
      keyset( "n", "gK", require("noice.lsp").hover,
        {
          desc = "Hover",
          silent = true,
          buffer=bufnr,
        }
      )
      keyset( { "i" }, "<C-K>", require("noice.lsp").signature,
        {
          desc = "toggle signature",
          noremap = true,
          silent = true,
          buffer=bufnr,
        }
      )
      keyset({ "n", "i", "s" }, "<c-f>", function()
        if not require("noice.lsp").scroll(4) then
          return "<c-f>"
        end
      end, { silent = true, expr = true })

      keyset({ "n", "i", "s" }, "<c-b>", function()
        if not require("noice.lsp").scroll(-4) then
          return "<c-b>"
        end
      end, { silent = true, expr = true })

      -- Navbudy
      keyset(
        'n',
        "<leader>N",
        "<CMD>Navbuddy<CR>",
        {silent= true}
      )

      -- Lsp simple
      -- Format
      vim.keymap.set('v', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end,
        {
          desc   = "Format",
          silent = true,
          buffer = bufnr,
        }
      )

    end

    require('lspconfig').clangd.setup{
      on_attach = on_attach,
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
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = require('lspconfig').util.root_pattern(
        'CMakePresets.json',
        'CTestConfig.cmake',
        '.git',
        'build',
        'cmake',
        'compile_commands.json'
      )
    }

    require('lspconfig').neocmake.setup{
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = require('lspconfig').util.root_pattern(
        '.git',
        'cmake',
        'compile_commands.json'
      ),
    }

    require('lspconfig').pyright.setup{
      on_attach = on_attach,
      capabilities = capabilities,
    }

    require('lspconfig').pylsp.setup{
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
    }

    require('lspconfig').texlab.setup{
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes    = { "tex", "plaintex", "bib" },
      root_dir = require('lspconfig').util.root_pattern(
        'References',
        'main'
      )
    }

    -- To support org files
    vim.cmd [[
      autocmd BufRead,BufNewFile *.org set filetype=org
    ]]

    require('lspconfig').ltex.setup{
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ltex = {
          -- language = "en-US",
          language = "es",
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
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "marksman", "server" },
    }

    -- require('lspconfig').markdown_oxide.setup{
    --   on_attach = on_attach,
    --   cmd = { "marksman", "server" },
    --   capabilities = capabilities,
    -- }

    -- require('lspconfig').grammarly.setup{
    -- 	filetypes = {"markdown"}
    -- }

    require('lspconfig').asm_lsp.setup{
      on_attach = on_attach,
      capabilities = capabilities,
    }

    require('lspconfig').svlangserver.setup{
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "vhdl", "verilog", "systemverilog"  },
      root_dir = require('lspconfig').util.root_pattern(
        '.git',
        '.gitignore',
        '.svlint.toml',
        '.svls.toml',
        'rtl'
      )
    }

    require('lspconfig').svls.setup{
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "svls", "-d" },
      filetypes = { "vhdl", "verilog", "systemverilog"  },
      root_dir = require('lspconfig').util.root_pattern(
        '.git',
        '.gitignore',
        '.svlint.toml',
        '.svls.toml',
        'rtl'
      )
    }

    require('lspconfig').vimls.setup{
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "vim-language-server", "--stdio" },
      filetypes = { "vim" }
    }

    require('lspconfig').lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
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
