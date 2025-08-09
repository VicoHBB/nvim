-- List of all enable lsp servers
vim.lsp.enable({
    "clangd",
    "cmake",
    "jsonls",
    "lua_ls",
    "marksman",
    "neocmake",
    "pyright",
    "ruff",
    "svls",
    "texlab",
    "verible",
})

-- List of all disable lsp servers
vim.lsp.enable({
    -- "asm_lsp",
    -- "bashls",
    -- "lemminx",
    -- "ltex",
    -- "rust_analyzer",
    -- "svlangserver",
    -- "textlsp",
    -- "vimls",
}, false)
