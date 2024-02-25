return {
  {
    'nvim-orgmode/orgmode',
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter',
        lazy = true,
      },
      "danilshvalov/org-modern.nvim"
    },
    event = 'VeryLazy',
    config = function()
      local Menu = require("org-modern.menu")

      -- Load treesitter grammar for org
      require('orgmode').setup_ts_grammar()

      -- Setup orgmode
      require('orgmode').setup({
        org_agenda_files = '~/.nb/orgfiles/**/*',
        org_default_notes_file = '~/nb/orgfiles/refile.org',
        ui = {
          menu = {
            handler = function(data)
              Menu:new({
                window = {
                  margin = { 1, 0, 1, 0 },
                  padding = { 0, 1, 0, 1 },
                  title_pos = "center",
                  border = "single",
                  zindex = 1000,
                },
                icons = {
                  separator = "➜",
                },
              }):open(data)
            end,
          },
        },
      })

      vim.api.nvim_create_autocmd('FileType', {
          pattern = 'org',
          group = vim.api.nvim_create_augroup('orgmode_telescope_nvim', { clear = true }),
          callback = function()
            vim.keymap.set('n', '<leader>or', require('telescope').extensions.orgmode.refile_heading)
          end,
        }
      )

    end,
  },
  {
    'andreadev-it/orgmode-multi-key',
    config = function ()
      require('orgmode-multi-key').setup({
        key = "<leader>O"
      })
    end,
  },
  -- {
  --   'akinsho/org-bullets.nvim',
  --   ft = {
  --     "markdown",
  --     "org",
  --     "neorg",
  --   },
  --   config = function()
  --     require('org-bullets').setup({
  --     })
  --   end,
  -- },
}
