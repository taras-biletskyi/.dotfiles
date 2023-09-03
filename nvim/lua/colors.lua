-- syntax enable
vim.cmd('filetype plugin indent on')
vim.o.guifont = 'DejaVuSansMono Nerd Font:h16:cANSI'
-- Breaks trancparency of gruvbox theme in the terminal & makes gruvbox work
vim.o.termguicolors = true
-- set Vim-specific sequences for RGB colors
-- let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
-- let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
------- gruvbox-community/gruvbox
--[[
   [ vim.g.gruvbox_termcolors = 256
   [ -- let g:gruvbox_termcolors=256
   [ 
   [ -- let g:gruvbox_transparent_bg=1
   [ -- let g:gruvbox_contrast_light=1
   [ vim.g.gruvbox_bold = 1
   [ vim.g.gruvbox_italic_comments = true
   [ vim.g.gruvbox_italic = 0
   [ vim.g.gruvbox_underline = 1
   [ vim.g.gruvbox_undercurl = 1
   [ vim.g.gruvbox_contrast_dark = 'hard'
   [ vim.g.gruvbox_invert_selection = 0
   [ vim.opt.background = 'dark'
   [ vim.cmd [[colorscheme gruvbox]]
-- ]]
------- ellisonleao/gruvbox.nvim
require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = false,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false
})
vim.cmd("colorscheme gruvbox")

vim.cmd('highlight netrwDir guifg=#e4717a')
-- require'colorizer'.setup()
