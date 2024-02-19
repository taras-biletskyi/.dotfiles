-- defaults
require("diffview").setup({
	enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
	use_icons = false, -- Requires nvim-web-devicons
	show_help_hints = true, -- Show hints for how to open the help panel
	watch_index = true, -- Update views and index buffers when the git index changes.
})

local map = vim.api.nvim_set_keymap
-- it is also posible to pass a range into DiffviewFileHistory
-- altough don't know how to map that
map("n", "<leader>hh", ":DiffviewFileHistory <CR>", {})
map("n", "<leader>ho", ":DiffviewOpen <CR>", {})
map("n", "<leader>hc", ":DiffviewClose <CR>", {})
map("n", "<leader>hb", ":DiffviewFileHistory % <CR>", {})
