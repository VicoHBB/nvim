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
        org_agenda_files = '~/.nb/Org/**/*',
        org_default_notes_file = '~/.nb/Org/refile.org',
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
  -- {
  --   "nvim-orgmode/telescope-orgmode.nvim",
  --   event = "VeryLazy",
  --   ft = "org",
  --   dependencies = {
  --     "nvim-orgmode/orgmode",
  --     "nvim-telescope/telescope.nvim",
  --   },
  --   config = function()
  --     require("telescope").load_extension("orgmode")
  --
  --     vim.keymap.set("n", "<leader>r", require("telescope").extensions.orgmode.refile_heading)
  --     vim.keymap.set("n", "<leader>n", require("telescope").extensions.orgmode.search_headings)
  --     vim.keymap.set("n", "<leader>li", require("telescope").extensions.orgmode.insert_link)
  --   end,
  -- }
}


