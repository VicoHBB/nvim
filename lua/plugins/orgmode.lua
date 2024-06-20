return {
  {
    'nvim-orgmode/orgmode',
    dependencies = {
      'danilshvalov/org-modern.nvim'
    },
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      -- Setup orgmode
      local Menu = require("org-modern.menu")
      require('orgmode').setup({
        org_agenda_files = '~/.nb/orgfiles/**/*',
        org_default_notes_file = '~/.nb/orgfiles/refile.org',
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
    end,
  },
  {
    'akinsho/org-bullets.nvim',
    ft = { 'org' },
    config = function()
      require('org-bullets').setup()
    end
  },
  {
    "nvim-orgmode/telescope-orgmode.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-orgmode/orgmode",
      "nvim-telescope/telescope.nvim",
    },
    ft = {
      'org',
    },
  }
}

