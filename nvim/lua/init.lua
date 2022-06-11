require('plugins')
require('sets')
require('keymaps')

-- " Makes tmux work with vim
-- " https://github.com/tmux-plugins/vim-tmux-focus-events/issues/2#issuecomment-87863831
vim.cmd[[
au FocusGained * silent redraw!
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=700}
]]
