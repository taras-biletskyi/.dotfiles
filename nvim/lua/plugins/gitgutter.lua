local map = vim.api.nvim_set_keymap
-- map("", "gw", ":bd<cr>", {})
---------------------------- gitgutter
-- No remaps from this plugin
vim.g.gitgutter_map_keys = 0
map ("n", "<leader>gn", "<Plug>(GitGutterNextHunk)", {})
map ("n", "<leader>gp", "<Plug>(GitGutterPrevHunk)", {})
map ("n", "<leader>ghh", "<Plug>(GitGutterPreviewHunk)", {})
map ("n", "<leader>gs", "<Plug>(GitGutterStageHunk)", {noremap = true})
map ("n", "<leader>gu", "<Plug>(GitGutterUndoHunk)", {noremap = true})
map ("n", "<leader>ghb", ":GitGutterQuickFixCurrentFile <bar> :lopen <CR>)", {noremap = true})
map ("n", "<leader>ghw", ":GitGutterQuickFix <bar> :copen <CR>", {noremap = true})
vim.cmd [[
highlight GitGutterAdd    ctermfg=none
highlight GitGutterChange ctermfg=none
highlight GitGutterDelete ctermfg=none
highlight! GitGutterChangeDelete guifg='#8ec07c'
]]
vim.cmd [[
hi SignColumn guibg=none ctermbg=none
]]

