function _G.FoldFormat()
    local line = vim.fn.getline(vim.v.foldstart)    -- Toma la primera línea del fold
    local lines = vim.v.foldend - vim.v.foldstart + 1 -- Cuenta las líneas del fold

    return line .. "    (" .. lines .. " lines) "
end

-- [[ Folding Configuration (Treesitter) ]]
vim.opt.foldmethod = "expr"                          -- Use Treesitter for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Folding expression provided by Treesitter
vim.opt.foldenable = true                            -- Enable folding
vim.opt.foldlevel = 99                               -- Show all folds by default
vim.opt.foldtext = "v:lua.FoldFormat()"
