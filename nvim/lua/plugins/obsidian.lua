require("obsidian").setup({
    dir = "~/personal/fault",
    daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "daily",
        -- Optional, if you want to change the date format for daily notes.
        date_format = "%Y-%m-%d"
    }
})


local map = vim.api.nvim_set_keymap
-- it is also posible to pass a range into DiffviewFileHistory
    -- altough don't know how to map that
map ("n", "<leader>of", ":ObsidianQuickSwitch<CR>", {})
map ("n", "<leader>og", ":ObsidianSearch<CR>", {})
map ("n", "<leader>ob", ":ObsidianBacklinks<CR>", {})
map ("n", "<leader>oo", ":ObsidianOpen<CR>", {})
