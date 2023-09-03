vim.cmd [[
let g:firenvim_config = {
    \ 'localSettings': {
        \ '.*': {
            \ 'takeover': 'never',
        \ },
    \ }
\ }
]]
-- disable lualine in firenvim (browser extension)
vim.cmd [[
if exists('g:started_by_firenvim')
lua << EOF
require('lualine').hide({
    place = {'statusline', 'tabline', 'winbar'}, -- The segment this change applies to.
    unhide = false,  -- whether to reenable lualine again/
})
EOF
endif
]]
