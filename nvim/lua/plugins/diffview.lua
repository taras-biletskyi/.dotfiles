-- defaults
require("diffview").setup({
  enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
  use_icons = false,         -- Requires nvim-web-devicons
  show_help_hints = true,   -- Show hints for how to open the help panel
  watch_index = true,       -- Update views and index buffers when the git index changes.
})

local map = vim.api.nvim_set_keymap
map ("n", "<leader>gdh", ":DiffviewFileHistory <CR>", {})
map ("n", "<leader>gdo", ":DiffviewOpen <CR>", {})
map ("n", "<leader>gdc", ":DiffviewClose <CR>", {})
