return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup({
          ui = {
             -- Whether to automatically check for new versions
             -- when opening the :Mason window.
              check_outdated_packages_on_open = true,

              -- The border to use for the UI window.
              -- Accepts same border values as |nvim_open_win()|.
              border = "double",

              -- Width of the window. Accepts:
              -- - Integer greater than 1 for fixed width.
              -- - Float in the range of 0-1 for a percentage of screen width.
              width = 0.8,

              -- Height of the window. Accepts:
              -- - Integer greater than 1 for fixed height.
              -- - Float in the range of 0-1 for a percentage of screen height.
              height = 0.9,

              icons = {
                  package_installed = "✓",
                  package_pending = "➜",
                  package_uninstalled = "✗"
              }
          }
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd"
        },
        automatic_installation = false,
      })

    end,
}
