return {
  "nvim-tree/nvim-tree.lua",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    -- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw       = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors    = true
    -- OR setup with some options
    require("nvim-tree").setup({
      --create_in_closed_folder = true,
      hijack_cursor = true,
      --open_on_setup = true,
      --open_on_setup_file = false,
      --focus_empty_on_setup = true,
      -- root_dirs = {},
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true
      },
      --ignore_ft_on_setup = { "dashboard" },
      sort_by = "case_sensitive",
      view = {
        adaptive_size = true,
        -- mappings = {
        --    list = { },
        -- },
      },
      renderer = {
        full_name = true,
        group_empty = true,
        special_files = {},
        symlink_destination = false,
        indent_markers = {
          enable = true,
        },
        icons = {
          git_placement = "after",
          webdev_colors = true,
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
      },
      filters = {
        dotfiles = true,
      },

      actions = {
        change_dir = {
          enable = false,
          restrict_above_cwd = true,
        },
        open_file = {
          quit_on_open = true,
          resize_window = true,
          window_picker = {
            chars = "aoeui",
          },
        },
        remove_file = {
          close_window = true,
        },
      },

      log = {
        enable = true,
        truncate = true,
        types = {
          diagnostics = true,
          git = true,
          profile = true,
          watcher = true,
        },
      },

    })
  end,
}
