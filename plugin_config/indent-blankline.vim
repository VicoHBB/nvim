lua << EOF

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
--vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

--Rainbow
--vim.opt.termguicolors = true
--vim.cmd [[highlight IndentBlanklineIndent1 guifg=#CC241D gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent2 guifg=#98971A gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent3 guifg=#D79921 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent4 guifg=#458588 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent5 guifg=#B16286 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent6 guifg=#689D6A gui=nocombine]]
--
--vim.opt.list = true
--vim.opt.listchars:append "space:⋅"
----vim.opt.listchars:append "eol:↴"
--
--require("indent_blankline").setup {
--    space_char_blankline = " ",
--    char_highlight_list = {
--        "IndentBlanklineIndent1",
--        "IndentBlanklineIndent2",
--        "IndentBlanklineIndent3",
--        "IndentBlanklineIndent4",
--        "IndentBlanklineIndent5",
--        "IndentBlanklineIndent6",
--    },
--}

EOF
