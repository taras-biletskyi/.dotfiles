" ***************************************************************************************
" Plugins
" ***************************************************************************************
call plug#begin('~/.vim/plugged')
" Colortheme
Plug 'gruvbox-community/gruvbox'
" Status bar at the bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" displaying thin vertical lines at each indentation level for code indented with spaces
" Plug 'Yggdroot/indentLine'
" colors for codes
" Plug 'ap/vim-css-color'
" Auto pairings
Plug 'jiangmiao/auto-pairs'
" Gutter to the right of line numbers
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Symbols outline plugin
Plug 'simrat39/symbols-outline.nvim'
" Start screen
Plug 'mhinz/vim-startify'
" Plugin for commenting code
Plug 'preservim/nerdcommenter'
" Completions to come along with neovim/nvim-lspconfig
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-cmdline'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'
" Code actions lightbulb working with nvim-lspconfig
Plug 'kosayoda/nvim-lightbulb'
" Telescope plugins
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Code highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Shortcuts cheat sheet
Plug 'folke/which-key.nvim'
" Debuger
" Plug 'puremourning/vimspector'
" Plugins for nvim-dap debugger
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'mfussenegger/nvim-dap-python'
" Helps to restore vim session after reboot
" Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'sbdchd/neoformat'
" DOcument GEnerator
Plug 'kkoomen/vim-doge' " After PlugInstall - :call doge#install()
Plug 'mbbill/undotree'
call plug#end()

" Makes tmux work with vim
" https://github.com/tmux-plugins/vim-tmux-focus-events/issues/2#issuecomment-87863831
au FocusGained * silent redraw!
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=700}

" ---------------------------- SETS
set splitbelow splitright
set nocompatible
set cursorline
set guicursor=a:block
set scrolloff=10
" Sets the match mode for command-line completions
set wildmenu
set wildmode=longest:full,full
set updatetime=50
" Avoid showing message extra message when using completion
set shortmess+=c
set mouse=a
" set t_Co=256
" Needed to keep multiple buffers open
set hidden
set encoding=utf-8
" Display line numbers and relative numbers
set number relativenumber
" shows a symbol for lines that are wraped
set showbreak=↪\
" specifies characters for set list to show
    " eol:↲
" set listchars=tab:→\,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set listchars=tab:→\ ,trail:•,extends:⟩,precedes:⟨
set list
set signcolumn=auto:1-3
set tabstop=4 softtabstop=4
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" set autoindent
set smartindent
set nowrap
set smarttab
set laststatus=3
set nobackup
" Does not show which mode is on on a separate line
set noshowmode
set colorcolumn=80
" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
" set ignorecase
" Include only uppercase words with uppercase search term
" set smartcase
set sidescroll=1
set undofile
set completeopt=menu,menuone,noselect
set undodir=~/.vim/undodir
" Do not conceal any symbols (works in .md)
set conceallevel=0
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:netrw_browse_split = 0
" close the netrw browser when opening a file
let g:netrw_fastbrowse = 0
let g:netrw_bufsettings = 'noma nomod nu rnu nowrap ro nobl'
" Ignore files in vimgrep, atleast
set wildignore+=*.pyc
set wildignore+=**/venv/*
set wildignore+=**/data/*
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" ---------------------------- REMAPS
" Responsible for some visual effects?
" autocmd VimEnter * hi Normal ctermbg=none
" Go next & go previous & close buffers
map gn :bn<cr>
map gp :bp<cr>
map gw :bd<cr>
" Move lines up and down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
let mapleader=" "
" Paste/delete into black-hole register
xnoremap <leader>p "_dP
" nnoremap <leader>d "_d
" vnoremap <leader>d "_d
" Yank into system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
" set space to not do anything in normal/visual mode
" Local & Quickfix lists
nnoremap <leader>lo :lopen<cr>
nnoremap <leader>lc :lclose<cr>
nnoremap <leader>ln :lnext<cr>
nnoremap <leader>lp :lprevious<cr>
nnoremap <leader>lf :lfirst<cr>
nnoremap <leader>ll :llast<cr>
nnoremap <leader>qo :copen<cr>
nnoremap <leader>qc :cclose<cr>
nnoremap <leader>qn :cnext<cr>
nnoremap <leader>qp :cprevious<cr>
nnoremap <leader>qf :cfirst<cr>
nnoremap <leader>ql :clast<cr>
" ---------------------------- COLORSCHEME
" syntax enable
filetype plugin indent on
set guifont=DejaVuSansMono\ Nerd\ Font:h16:cANSI
" Breaks trancparency of gruvbox theme in the terminal & makes gruvbox work
set termguicolors
" set Vim-specific sequences for RGB colors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:gruvbox_termcolors=256
" let g:gruvbox_transparent_bg=1
" let g:gruvbox_contrast_light=1
let g:gruvbox_bold=1
let g:gruvbox_italic=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection=0
set background=dark
colorscheme gruvbox
highlight netrwDir guifg=#e4717a

" ---------------------------- gitgutter
" No remaps from this plugin
let g:gitgutter_map_keys = 0
nmap <leader>gn <Plug>(GitGutterNextHunk)
nmap <leader>gp <Plug>(GitGutterPrevHunk)
nmap <leader>ghh <Plug>(GitGutterPreviewHunk)
noremap <leader>gs <Plug>(GitGutterStageHunk)
noremap <leader>gu <Plug>(GitGutterUndoHunk)
noremap <leader>ghb :GitGutterQuickFixCurrentFile<cr>
noremap <leader>ghw :GitGutterQuickFix<cr>
highlight GitGutterAdd    ctermfg=none
highlight GitGutterChange ctermfg=none
highlight GitGutterDelete ctermfg=none
highlight! GitGutterChangeDelete guifg='#8ec07c'
" let g:gitgutter_set_sign_backgrounds=1
hi SignColumn guibg=none ctermbg=none
" Status bar
" ***************************************************************************************
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

" =====START===== nvim-telescope/telescope.nvim  ==========
lua << EOF
require('telescope').setup{
  pickers = {
    git_files = {
      theme = "ivy",
    }
  }
}
-- Falling back to find_files if git_files can't find a .git directory
-- `_G` allows to call Lua functions in the global namespace (_G) directly from Vimscript.
function _G.project_files()
    local opts = {} -- define here if you want to define something
    local ok = pcall(require "telescope.builtin".git_files, {show_untracked = true})
    if not ok then
        require "telescope.builtin".find_files(
            require("telescope.themes").get_ivy({hidden = false, follow = true, no_ignore = false})
        )
    end
end
EOF
nnoremap <leader>tf <cmd>lua project_files() <CR>
nnoremap <leader>tg <cmd>lua require("telescope.builtin").live_grep(require('telescope.themes').get_ivy()) <CR>
nnoremap <leader>tb <cmd>lua require("telescope.builtin").buffers(require('telescope.themes').get_ivy()) <CR>
nnoremap <leader>tt <cmd>lua require("telescope.builtin").lsp_document_symbols(require('telescope.themes').get_ivy()) <CR>
nnoremap <leader>td <cmd>lua require("telescope.builtin").git_files(require('telescope.themes').get_ivy({prompt_title = ".dotfiles", cwd = "~/.dotfiles/", show_untracked = true}))<CR>
" builtin.quickfix
" builtin.loclist
" builtin.man_pages
" builtin.command_history
" =====END===== 'nvim-telescope/telescope.nvim'  ==========

" =====START===== preservim/nerdcommenter  ==========
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use one space after # comment character in python,
" see http://tinyurl.com/y4hm29o3
let g:NERDAltDelims_python = 1
" Align line-wise comment delimiters flush left instead
" of following code indentation
let g:NERDDefaultAlign = 'left'
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" =====END===== preservim/nerdcommenter  ==========

" =====START===== hrsh7th/nvim-cmp  ==========
lua <<EOF
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
local lspkind = require("lspkind")
local lspconfig = require("lspconfig")
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {"clangd", "gopls", "pyright", "tsserver", "vimls", "sumneko_lua", "jsonls"}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities
    }
end
-- lspkind setup to show icons in completion menu
local function get_kind(kind_item)
    local prsnt, lspkind = pcall(require, "lspkind")
    if not prsnt then
        return kind_icons
    else
        return lspkind.presets.default[kind_item]
    end
end
-- luasnip setup
local luasnip = require "luasnip"
local cmp = require "cmp"
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    window = {},
    mapping = cmp.mapping.preset.insert(
        {
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({select = false}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ["<Tab>"] = cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end,
                {"i", "s"}
            ),
            ["<S-Tab>"] = cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end,
                {"i", "s"}
            )
        }
    ),
    sources = cmp.config.sources(
        {
            {name = "nvim_lsp"},
            {name = "path"},
            {
                name = "buffer",
                options = {
                    get_bufnrs = function()
                        return vim.api.nvim_list_bufs()
                    end
                }
            },
            {name = "luasnip"},
            {name = "emoji"}
        }
    ),
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s %s", get_kind(vim_item.kind), vim_item.kind)
            vim_item.menu =
                ({
                nvim_lsp = "[Lsp]",
                luasnip = "[Snp]",
                path = "[Pth]",
                buffer = "[Buf]",
                nvim_lua = "[Lua]",
                calc = "[Clc]",
                emoji = "[Emj]"
            })[entry.source.name]
            return vim_item
        end
    }
}
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
    "/",
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            {name = "buffer"}
        }
    }
)
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
    ":",
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
            {
                {name = "path"}
            },
            {
                {name = "cmdline"}
            }
        )
    }
)
-- EOF
-- =====END===== hrsh7th/nvim-cmp  ==========
-- =====START===== neovim/nvim-lspconfig  ==========
-- Initializes pyright, rust_analyzer lsp server
-- lua << EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<leader>ee", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>eb", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ew", "<cmd>lua vim.diagnostic.setqflist()<CR>", opts)
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    -- vim.lsp.buf.incoming_calls()
    -- vim.lsp.buf.outgoing_calls()
end
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {"pyright", "gopls", "vimls", "clangd", "tsserver", "sumneko_lua", "jsonls"}
for _, lsp in pairs(servers) do
    require("lspconfig")[lsp].setup {
        on_attach = on_attach,
        flags = {
            -- This will be the default in neovim 0.7+
            debounce_text_changes = 150
        }
    }

vim.cmd [[
  highlight! DiagnosticSignError guibg=none guifg=#fb4934
  highlight! DiagnosticSignWarn guibg=none guifg=#d79921
  highlight! DiagnosticSignInfo guibg=none guifg=#83a598
  highlight! DiagnosticSignHint guibg=none guifg=#689d9a

  sign define DiagnosticSignError text=E texthl=DiagnosticSignError
  sign define DiagnosticSignWarn text=W texthl=DiagnosticSignWarn
  sign define DiagnosticSignInfo text=I texthl=DiagnosticSignInfo
  sign define DiagnosticSignHint text=H texthl=DiagnosticSignHint
]]
end
EOF
" =====END===== neovim/nvim-lspconfig ==========

" =====START===== kosayoda/nvim-lightbulb ==========
lua << EOF
function update_lightbulb()
    require "nvim-lightbulb".update_lightbulb {
        sign = {enabled = false},
        float = {enabled = false},
        virtual_text = {
            enabled = true,
            text = "🔦",
            hl_mode = "combine"
        }
    }
end
vim.cmd [[autocmd CursorHold,CursorHoldI * lua update_lightbulb()]]
EOF
" =====END===== kosayoda/nvim-lightbulb ==========

" =====START===== nvim-treesitter/nvim-treesitter ==========
" Additionaly need to install language packs vis :TSInstall
lua << EOF
require "nvim-treesitter.configs".setup {
    indent = {enable = false},
    highlight = {enable = true},
    incremental_selection = {enable = true, keymaps = {init_selection = "grrrrr"}},
    textobjects = {enable = true}
}
EOF
" =====END===== nvim-treesitter/nvim-treesitter ==========

" =====START===== folke/which-key.nvim ==========
lua << EOF
require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    }
EOF
" =====END===== folke/which-key.nvim ==========

" =====START===== Neo ==========
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
" =====END===== Neo ==========

" =====START===== puremourning/vimspector ==========
" https://github.com/puremourning/vimspector#visual-studio--vscode
" let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
" let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]
" =====END===== puremourning/vimspector ==========

" =====START===== mfussenegger/nvim-dap ==========
" Docs: https://github.com/mfussenegger/nvim-dap/blob/master/doc/dap.txt
nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F6> <Cmd>lua require'dap'.terminate()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>dbb <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>dbc <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>dbl <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.toggle()<CR>
" nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
nnoremap <silent> <Leader>dtc <Cmd>lua require'dap'.run_to_cursor()<CR>
" run_to_cursor() This temporarily removes all breakpoints, sets a breakpoint at the cursor, resumes execution and then adds back all breakpoints again.
" from mfussenegger/nvim-dap-python
nnoremap <silent> <leader>dtm :lua require('dap-python').test_method()<CR>
nnoremap <silent> <leader>dtc :lua require('dap-python').test_class()<CR>
vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>
lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
" trigger REPL compoletions automatically
au FileType dap-repl lua require('dap.ext.autocompl').attach()
lua << EOF
local dap = require('dap')
EOF
" =====END===== mfussenegger/nvim-dap ==========

" =====START===== rcarriga/nvim-dap-ui ==========
"    default mappings = {
"        expand = { "<CR>", "<2-LeftMouse>" },
"        open = "o",
"        remove = "d",
"        edit = "e",
"        repl = "r",
"        toggle = "t",
"    }
lua << EOF
require("dapui").setup()
-- initialize the UI on dap startup
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
EOF
" eval floating window
    " same command to jumpt to the window
noremap <Leader>de <Cmd>lua require("dapui").eval()<CR>
" =====END===== rcarriga/nvim-dap-ui ==========

" =====START===== theHamsta/nvim-dap-virtual-text ==========
lua << EOF
require("nvim-dap-virtual-text").setup()
EOF
" =====END===== theHamsta/nvim-dap-virtual-text ==========

" =====START===== nvim-telescope/telescope-dap.nvim ==========
lua << EOF
require('telescope').load_extension('dap')
EOF
" =====END===== nvim-telescope/telescope-dap.nvim ==========

" =====START===== kkoomen/vim-doge ==========
let g:doge_doc_standard_python = 'numpy'
let g:doge_comment_jump_modes = ['n', 's']
let g:doge_mapping = '<Leader>doge'
" =====END===== kkoomen/vim-doge ==========
" mbbill/undotree

" =====START===== mbbill/undotree ==========
nnoremap <Leader>u :UndotreeToggle <CR> :UndotreeFocus <CR>
" =====END===== mbbill/undotree ==========
"
" Usefull vim stuff
    " Commands:
        " = - auto-indent
        " [m | ]m - previous | next method start or END
        " [{ | ]} - got to start | end of the block
        " . - repeat last command
        " J | gJ - join lines without spaces | with spaces
        " zz - vertically center the current line
        " gq - wraps lines according to the column width
        " gf | gF - jump to file under cursor | file and line
        " g~ | gu | gU - switch case | to lower case | to upper case
        " g?? - Rot13 encode current line. LUL
        " g, - go to newer position in change list
        " g; - go to older position in change list
        " gs - go to sleep for n(1) seconds
        " C-w - panes related commands
        " C-O | C-I - Retrace your movements in file in backwards | forwards
        " ^-G - shows current file path + basic info. If 1 + ^-G, shows full
            " path, count >= 2 shows current buffer number.
    " Line commands
        " :rustfmt - formats the code in the current buffer with rust-lang/rustfmt
        " :set spell | set nospell - turn on | off spell
        " :noh - no highlight; turns off highlighted words after search
        " :e - open a file by specifying a path
        " :e! - reload the file
        " :r - read the file into the current buffer
        " :retab[!] - convert tabs to spaces
    " Search
        " :s - substitute
        " /\s\+$ - highlights trailing whitespaces
        " # | * - press those commands when hovering over a word to go
        " to the next occurence of the word or last respectively
        " ggn | GN - jump to the first and last matches respectively
        " / > Ctrl-r > Ctrl-w - copy the word under cursor to the command
            " line
    " Quickfix lists
        " :grep | :vimgrep - external and internal grep
        " :cnext | :cprev | :copen - next | prev searches and open the list
