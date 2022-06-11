-- syntax enable
vim.cmd('filetype plugin indent on')
vim.o.guifont = 'DejaVuSansMono Nerd Font:h16:cANSI'
-- Breaks trancparency of gruvbox theme in the terminal & makes gruvbox work
vim.o.termguicolors = true
-- set Vim-specific sequences for RGB colors
-- let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
-- let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
vim.g.gruvbox_termcolors = 256
-- let g:gruvbox_termcolors=256

-- let g:gruvbox_transparent_bg=1
-- let g:gruvbox_contrast_light=1
vim.g.gruvbox_bold=1
vim.g.gruvbox_italic=1
vim.g.gruvbox_underline=1
vim.g.gruvbox_undercurl=1
vim.g.gruvbox_contrast_dark='hard'
vim.g.gruvbox_invert_selection=0
vim.o.background = 'dark'
vim.cmd[[colorscheme gruvbox]]
vim.cmd('highlight netrwDir guifg=#e4717a')
