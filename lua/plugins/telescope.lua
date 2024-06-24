return {
  'nvim-telescope/telescope.nvim',
  -- tag = '0.1.1',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This "ill not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
      event = "VeryLazy",
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build =
      "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    {
      'tsakirist/telescope-lazy.nvim',
      event = "VeryLazy",
    },
  },
  config = function()
    local actions = require("telescope.actions")
    local function quote_prompt(prompt_bufnr)
      require("telescope-live-grep-args.actions").quote_prompt()(prompt_bufnr)
    end
    local function quote_prompt_ignoredir(prompt_bufnr)
      require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob '!**/ignoredir/**'" })(
        prompt_bufnr)
    end
    local function quote_prompt_type(prompt_bufnr)
      require("telescope-live-grep-args.actions").quote_prompt({ postfix = " -t " })(prompt_bufnr)
    end

    require('telescope').setup {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "truncate" },
        inblend = 0,
        color_devicons = true,
        layout_strategy = "horizontal",
        layout_config = {
          width = 0.87,
          height = 0.80,
          prompt_position = "top",
          vertical = {
            width = 0.5,
            height = 100,
          },
          horizontal = {
            preview_width = 0.5,
            results_width = 0.5,
            preview_cutoff = 0,
          },
        },
        set_env = { ["COLORTERM"] = "truecolor" },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            ["<C-c>"] = actions.close,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,

            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,

            -- ["<C-\'>"] = lga_actions.quote_prompt(),
            -- ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          },

          n = {
            ["<esc>"] = actions.close,
            ["q"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,

            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down
          },
        },
      },

      pickers = {
        spell_suggest = {
          theme = "cursor",
          prompt_tittle = "Spell"
        },
      },

      extensions = {

        fzf = {
          fuzzy = true,                     -- false will only do exact matching
          override_generic_sorter = true,   -- override the generic sorter
          override_file_sorter = true,      -- override the file sorter
          case_mode = "smart_case",         -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        lazy = {
          -- Optional theme (the extension doesn't set a default theme)
          theme = "ivy",
          -- Whether or not to show the icon in the first column
          show_icon = true,
          -- Mappings for the actions
          mappings = {
            open_in_browser = "<C-o>",
            open_in_file_browser = "<M-b>",
            open_in_find_files = "<C-f>",
            open_in_live_grep = "<C-g>",
            open_plugins_picker = "<C-b>",   -- Works only after having called first another action
            open_lazy_root_find_files = "<C-r>f",
            open_lazy_root_live_grep = "<C-r>g",
          },
          -- Other telescope configuration options
        },

        live_grep_args = {
          auto_quoting = true,   -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = {           -- extendmmappings
            i = {
              ["<A-r>"] = quote_prompt,
              ["<A-d>"] = quote_prompt_ignoredir,
              ["<A-t>"] = quote_prompt_type,
            }
          },
        },

        neoclip = {
          prompt_title = "Registers"
        },

      },
    }

    require("telescope").load_extension "lazy"
    require('telescope').load_extension('yabs')
    require('telescope').load_extension('orgmode')
    require('telescope').load_extension('neoclip')
    require("telescope").load_extension("live_grep_args")
  end,
}
