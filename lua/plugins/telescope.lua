return {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    'nvim-telescope/telescope-media-files.nvim',
    'jvgrootveld/telescope-zoxide',
    'fannheyward/telescope-coc.nvim',
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    'nvim-telescope/telescope-project.nvim',
    -- 'nvim-telescope/telescope-file-browser.nvim',
  },
  config = function()

    require('telescope').load_extension('media_files')
    require("telescope").load_extension('zoxide')
    require('telescope').load_extension('coc')
    require("telescope").load_extension("ui-select")
    require("telescope").load_extension('harpoon')
    require('telescope').load_extension('project')
    -- require("telescope").load_extension("file_browser")

    require'telescope'.setup {
      defaults= {
        layout_config = {
          horizontal = {
            preview_cutoff = 0,
            },
        },
      },
      extensions = {
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          filetypes = {"png", "webp", "jpg", "jpeg"},
          find_cmd = "rg" -- find command (defaults to `fd`)
        },
        zoxide = {
          prompt_prefix=🔍,
          prompt_title = "[ Walking on the shoulders of TJ ]",
        },
        coc = {
          theme = 'ivy',
          prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }

          -- pseudo code / specification for writing custom displays, like the one
          -- for "codeactions"
          -- specific_opts = {
          --   [kind] = {
          --     make_indexed = function(items) -> indexed_items, width,
          --     make_displayer = function(widths) -> displayer
          --     make_display = function(displayer) -> function(e)
          --     make_ordinal = function(e) -> string
          --   },
          --   -- for example to disable the custom builtin "codeactions" display
          --      do the following
          --   codeactions = false,
          -- }
        }
      },
    }

  end,

}
