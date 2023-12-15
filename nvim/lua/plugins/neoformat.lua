-- TODO: make this in Lua
vim.cmd [[
let g:neoformat_python_black = {
            \ 'exe': 'black',
            \ 'args': ['-l 80', '-'],
            \ 'stdin': 1,
            \ }

let g:neoformat_enabled_python = ['black']
" To format sh files with shfmt
let g:shfmt_opt="-ci -bn -i 4 -sr"

let g:neoformat_c_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['-style="{BasedOnStyle: llvm, IndentWidth: 4}"'],
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
let g:neoformat_enabled_markdown = ['prettier']
let g:neoformat_markdown_prettier =  {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin-filepath', '"%:p"', "--tab-width 2", "--prose-wrap always"],
            \ 'stdin': 1,
            \ 'try_node_exe': 1,
            \ }
]]

-- TODO: see if this plugin supports arguments for separate formatters yet
require("conform").setup({
    formatters_by_ft = {
        c = {"clang_format"},
        lua = { "luaformat" },
        -- Formatters can also be specified with additional options
        python = {
            formatters = { "isort", "black" },
            args = {""},
            -- Run formatters one after another instead of stopping at the first success
            run_all_formatters = true,
        },
        go = {
            formatters = {"gofmt", "gofumpt", "golines", "goimports"},
            run_all_formatters = true,
        },
        yaml = {"prettier"}
    },
})
