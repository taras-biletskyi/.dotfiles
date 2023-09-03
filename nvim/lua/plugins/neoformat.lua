-- TODO: make this in Lua
vim.cmd [[
let g:neoformat_python_black = {
            \ 'exe': 'black',
            \ 'args': ['-l 80', '-'],
            \ 'stdin': 1,
            \ }

let g:neoformat_enabled_python = ['black']
" To format sh files with shfmt
let g:shfmt_opt="-ci"

let g:neoformat_c_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['-style="{BasedOnStyle: google, IndentWidth: 4}"'],
            \ 'stdin': 1
            \ }
let g:neoformat_enabled_c = ['clangformat']
" for TOML files
let g:neoformat_enabled_toml = ['taplo']
" for Lua
    " luarocks luaformatter
let g:neoformat_lua_luaformat =  {
            \ 'exe': 'lua-format',
            \ 'args': ["--column-limit=80", "--indent-width=4", "--tab-width=4", "--no-use-tab"],
            \ 'stdin': 1
            \ }
let g:neoformat_enabled_lua = ['luaformat']
let g:neoformat_enabled_yaml = ['prettier']
]]
