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
map ("n", "<leader>ghb", ":GitGutterQuickFixCurrentFile <bar> :copen <CR>)", {noremap = true})
map ("n", "<leader>ghw", ":GitGutterQuickFix <bar> :copen <CR>", {noremap = true})
vim.cmd [[
highlight GitGutterAdd    guifg='#98971A' guibg=none
highlight GitGutterChange guifg='#FABD2F' guibg=none
highlight GitGutterDelete guifg='#FB4934' guibg=none
highlight! GitGutterChangeDelete guifg='#8EC07C' guibg=none
]]
vim.cmd [[
hi SignColumn guibg=none ctermbg=none
]]

