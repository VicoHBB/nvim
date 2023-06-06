return {
  'mfussenegger/nvim-lint',                                       -- Linter
  config = function()
    -- linter
    require('lint').linters_by_ft = {
     -- markdown = {'vale',}
      -- c = { cpplint, cppcheck,}
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
