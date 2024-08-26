return {
  'nvim-telescope/telescope.nvim',
  -- tag = '0.1.1',
  branch = '0.1.x',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
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
  },
  config = function()
    local actions = require("telescope.actions")
    local lga_actions = require("telescope-live-grep-args.actions")
    local action_state = require("telescope.actions.state")

    local function quote_prompt(prompt_bufnr)
      require("telescope-live-grep-args.actions").quote_prompt()(prompt_bufnr)
    end

    local function open_selection(prompt_bufnr)
      local picker = action_state.get_current_picker(prompt_bufnr)
      local multi = picker:get_multi_selection()
      actions.select_default(prompt_bufnr)         -- the normal enter behaviour
      for _, j in pairs(multi) do
        if j.path ~= nil then            -- is it a file -> open it as well:
          vim.cmd(string.format("%s %s", "edit", j.path))
        end
      end
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
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<CR>"] = open_selection,

            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<A-q>"] = actions.send_to_qflist + actions.open_qflist,

          },

          n = {

            ["<CR>"] = open_selection,

            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<A-q>"] = actions.send_to_qflist + actions.open_qflist,
          },
        },
      },

      pickers = {
        spell_suggest = {
          theme = "cursor",
          prompt_title = "Spell"
        },
        commands = {
          theme = "dropdown",
          prompt_title = "Commands"
        },
        current_buffer_fuzzy_find = {
          theme = "dropdown",
          prompt_title = "Current Buffer Lines",
        },
      },

      extensions = {

        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }
        },

        fzf = {
          fuzzy = true,                     -- false will only do exact matching
          override_generic_sorter = true,   -- override the generic sorter
          override_file_sorter = true,      -- override the file sorter
          case_mode = "smart_case",         -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },

        live_grep_args = {
          auto_quoting = true,   -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = {           -- extendmmappings
            i = {
              ["<CR>"] = open_selection,
              ["<C-r>"] = quote_prompt,
              ["<C-e>"] = lga_actions.quote_prompt({ postfix = " -g " }),
              ["<C-space>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              -- freeze the current list and start a fuzzy search in the frozen list
              ["<C-f>"] = actions.to_fuzzy_refine,
            }
          },
        },

        projects = {
          -- theme = "drop",
          theme = "ivy",
        }

      },
    }

    -- require('telescope').load_extension('orgmode')
    require('telescope').load_extension('projects')
    require("telescope").load_extension("live_grep_args")
    require("telescope").load_extension("ui-select")
  end,
}
