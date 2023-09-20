return {
  "preservim/tagbar",                                             -- Tagbar
  config = function ()

    vim.cmd([[
      " systemverilog {{{1
      let g:tagbar_type_systemverilog = {
          \ 'kinds' : [
              \ 'b:blocks:1',
              \ 'c:constants:1:0',
              \ 'e:events:1:0',
              \ 'f:functions:1',
              \ 'm:modules',
              \ 'n:nets:1:0',
              \ 'p:ports:1:0',
              \ 'r:registers:1:0',
              \ 't:tasks:1',
              \ 'A:assertions:1',
              \ 'C:classes',
              \ 'V:covergroups',
              \ 'I:interfaces',
              \ 'M:modport',
              \ 'K:packages',
              \ 'P:programs',
              \ 'R:properties',
              \ 'T:typedefs',
              \ '?:unknown',
          \ ],
      \ }
    ]])


  end
}
