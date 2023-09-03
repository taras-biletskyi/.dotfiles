vim.o.splitbelow = true
vim.o.splitright = true
vim.o.cursorline = true
vim.o.guicursor = "a:block"
vim.o.scrolloff = 10
vim.o.sidescrolloff = 20
-- Sets the match mode for command-line completions
vim.o.wildmenu = true
vim.o.wildmode = "longest:full,full"
vim.o.updatetime = 50
-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.mouse = "a"
-- set t_Co=256
-- Needed to keep multiple buffers open
vim.o.hidden = true
vim.o.encoding = "utf-8"
-- Display line numbers and relative numbers
vim.o.number = true
vim.o.relativenumber = true
-- shows a symbol for lines that are wraped
vim.cmd [[set showbreak=↪\]]
-- specifies characters for set list to show
-- set listchars=tab:→\,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"*"},
    callback = function()
        vim.opt_local.listchars = {
          tab = '→ ',
          extends = '⟩',
          precedes = '⟨',
          trail = '•'
        }
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"go"},
    callback = function()
        vim.opt_local.listchars = {
          tab = '  ',
          lead = '•',
          extends = '⟩',
          precedes = '⟨',
          trail = '•'
        }
    end
})
vim.o.list = true
vim.o.signcolumn = "auto:1-3"
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftwidth = 4
-- On pressing tab, insert 4 spaces
vim.o.expandtab = true
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"go"},
    callback = function()
        vim.opt_local.expandtab = false
    end
})
-- set autoindent
vim.o.smartindent = true
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"markdown", "text"},
    callback = function() vim.opt_local.wrap = true end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"sql", "qf", "python", "c", "go"},
    callback = function() vim.opt_local.wrap = false end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"gitcommit", "markdown"},
    callback = function() vim.cmd('set spell') end
})
vim.opt.wrap = false
vim.o.smarttab = true
vim.o.laststatus = 3
vim.o.backup = false
-- Does not show which mode is on on a separate line
vim.o.showmode = false
vim.opt.colorcolumn = '80'
-- Highlight matching search patterns
vim.o.hlsearch = true
-- Enable incremental search
vim.o.incsearch = true
-- Include matching uppercase words with lowercase search term
-- set ignorecase
-- Include only uppercase words with uppercase search term
-- set smartcase
vim.o.sidescroll = 1
vim.o.undofile = true
vim.o.completeopt = "menu,menuone,noselect"
-- This does not really work
    -- vim.opt.undodir = os.getenv("HOME") .. '/.vim/undodir'
vim.cmd [[set undodir=~/.vim/undodir]]
-- Do not conceal any symbols (works in .md)
vim.o.conceallevel = 0
vim.g.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}
vim.g.netrw_browse_split = 0
-- close the netrw browser when opening a file
vim.g.netrw_fastbrowse = 0
vim.g.netrw_bufsettings = "noma nomod nu rnu nowrap ro nobl"
-- Ignore files in vimgrep, atleast
vim.opt.wildignore:append{"*.pyc"}
vim.opt.wildignore:append{"**/venv/*"}
vim.opt.wildignore:append{"**/data/*"}
vim.opt.wildignore:append{"*_build/*"}
vim.opt.wildignore:append{"**/coverage/*"}
vim.opt.wildignore:append{"**/node_modules/*"}
vim.opt.wildignore:append{"**/android/*"}
vim.opt.wildignore:append{"**/ios/*"}
vim.opt.wildignore:append{"**/.git/*"}
vim.opt.wildignore:append{"**/debug/*"}
if io.popen('uname -m','r'):read('*l') == 'arm64' then
    vim.g.python3_host_prog = '/opt/homebrew/bin/python3'
else
    vim.g.python3_host_prog = '/usr/local/bin/python3'
end
vim.o.mmp = 200000
vim.o.history = 10000
vim.o.synmaxcol = 200
vim.opt.fillchars = { diff = '/' }
