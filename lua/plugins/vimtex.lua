return {
  {
    "lervag/vimtex",                                                -- VimTex
    lazy = false,     -- we don't want to lazy load VimTeX
    config = function ()
      vim.g.tex_flavor         = 'latex'
      vim.g.vimtex_view_method = 'zathura'
      vim.g.tex_conceal        = 'adbmg'

      vim.g.vimtex_compiler_method = 'latexmk'
     -- vim.g.vimtex_compiler_method = 'latexrun'
     -- vim.g.vimtex_compiler_method = 'arara'

      vim.cmd([[
        let g:vimtex_compiler_latexmk = {
            \ 'options' : [
            \   '-pdf',
            \   '-pdflatex="xelatex --shell-escape %O %S"',
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \   '-translate-file=cp227.tcx',
            \ ]
            \}
        " let g:vimtex_compiler_latexrun = {
        "     \ 'options' : [
        "     \   '--verbose-cmds',
        "     \   '--latex-args="-synctex=1"',
        "     \   '-pdflatex="xelatex --shell-escape %O %S"',
        "     \ ]
        "     \}
        " let g:vimtex_compiler_arara = {
        "     \ 'options' : [
        "     \   '--verbose-cmds',
        "     \   '--latex-args="-synctex=1"',
        "     \   '-pdflatex="xelatex --shell-escape %O %S"',
        "     \ ]
        "     \}
      ]])

      vim.cmd([[
        let g:vimtex_syntax_packages = {'minted': {'load': 2}}
      ]])

      vim.g.Tex_BibtexFlavor        = 'biber'
      vim.g.Tex_DefaultTargetFormat ="pdf"
      -- The following is relevant to make LaTeX rerun after biber if necessary:
      -- (include all formats for which re-running is to be enabled)
      vim.g.Tex_MultipleCompileFormats = 'pdf,dvi'
    end,
  }
}
