return {
  "iamcco/markdown-preview.nvim",
  enabled = true,
  ft = {
    "markdown",
  },
  cmd = {
    "MarkdownPreviewToggle",
    "MarkdownPreview",
    "MarkdownPreviewStop",
  },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    -- vim.cmd [[
    --   function OpenMarkdownPreview (url)
    --     execute "silent ! firefox --new-window " . a:url
    --   endfunction
    --   let g:mkdp_browserfunc = 'OpenMarkdownPreview'
    -- ]]
  end,
}
