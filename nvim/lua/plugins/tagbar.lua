vim.cmd[[
let g:tagbar_autoshowtag = 1
let g:tagbar_show_tag_count = 1
let g:tagbar_show_tag_linenumbers = 1
let g:tagbar_show_data_type = 1
let g:tagbar_sort = 0

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'scala',
    \ 'sro'       : '.',
    \ 'kinds'     : [
      \ 'p:packages',
      \ 'T:types:1',
      \ 't:traits',
      \ 'o:objects',
      \ 'O:case objects',
      \ 'c:classes',
      \ 'C:case classes',
      \ 'm:methods',
      \ 'V:values:1',
      \ 'v:variables:1'
    \ ]
\ }
]]
