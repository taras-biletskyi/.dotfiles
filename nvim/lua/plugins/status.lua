-- TODO: decide on airline or lualine
vim.cmd [[
" Needed to install special fonts for airline plugin -- https://github.com/powerline/fonts
let g:airline_theme='gruvbox' " <theme> is a valid theme name (minimalist, distinguished, one dark)
let g:airline_powerline_fonts = 1
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#branch#format = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1 " index is airlnies enumeration
let g:airline#extensions#tabline#buffer_nr_show = 1 " number is vim's
" Selects buffers
nmap g1 <Plug>AirlineSelectTab1
nmap g2 <Plug>AirlineSelectTab2
nmap g3 <Plug>AirlineSelectTab3
nmap g4 <Plug>AirlineSelectTab4
nmap g5 <Plug>AirlineSelectTab5
nmap g6 <Plug>AirlineSelectTab6
nmap g7 <Plug>AirlineSelectTab7
nmap g8 <Plug>AirlineSelectTab8
nmap g9 <Plug>AirlineSelectTab9
let g:airline#extensions#tabline#show_tab_count = 2
let g:airline#extensions#tabline#buf_label_first = 1
let g:airline_detect_modified=1
let g:airline_detect_crypt=1
let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#nvimlsp#enabled = 1
let g:airline#extensions#keymap#enabled = 0
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
" let g:airline_skip_empty_sections = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    let g:airline_symbols.colnr = ''
    let g:airline_symbols.linenr = ''
    let g:airline_symbols.maxlinenr = '|'
endif
if !exists('g:airline_section_z')
    if airline#util#winwidth() > 79
        " TODO: This does not seem to full-window toml files...
        " let g:airline_section_z = airline#section#create(['windowswap', 'obsession', '%p%%', 'linenr', 'maxlinenr', 'colnr'])
        let g:airline_section_z = airline#section#create(['windowswap', 'obsession', 'linenr', 'maxlinenr', 'colnr'])
    else
        " let g:airline_section_z = airline#section#create(['linenr', 'colnr'])
        let g:airline_section_z = airline#section#create(['windowswap', 'obsession', 'linenr', 'maxlinenr', 'colnr'])
    endif
endif

]]
