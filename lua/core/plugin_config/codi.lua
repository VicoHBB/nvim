-- Codi
-- Change the color
vim.cmd([[ highlight CodiVirtualText guifg=cyan ]])
-- vim.highlight.create('CodiVirtualText',{guifg="#00F7F7"},false)

vim.cmd([[
    let g:codi#virtual_text_prefix = "❯ "
]])

vim.cmd([[
 let g:codi#interpreters = {
    \ 'python': {
    \ 'bin': 'python',
    \ 'prompt': '^\(>>>\|\.\.\.\) ',
    \ },
    \ }
]])

vim.cmd([[
 let g:codi#aliases = {
                   \ 'javascript.jsx': 'javascript',
                   \ }
]])
