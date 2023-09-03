require("todo-comments").setup {
    signs = false, -- show icons in the signs column
    -- keywords recognized as todo comments
    keywords = {
        FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = {"FIXME", "BUG", "FIXIT", "ISSUE"} -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
        },
        TODO = {icon = " ", color = "info"},
        HACK = {icon = " ", color = "warning", alt = {"MAGIC", "NOBUG"}},
        WARN = {icon = " ", color = "warning", alt = {"WARNING", "XXX", "REFACTOR"}},
        PERF = {icon = " ", color = "perf", alt = {"OPTIM", "PERFORMANCE", "OPTIMIZE"}},
        NOTE = {icon = " ", color = "hint", alt = {"INFO"}},
        TEST = {icon = "⏲ ", color = "perf", alt = {"TESTING", "PASSED", "FAILED"}}
    },
    colors = {
        perf = { "GruvboxPurple" }
    },
    highlight = {
        keyword = "bg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "",
        pattern = [[.*<(KEYWORDS)\s*(.*)]], -- pattern or table of patterns, used for highlightng (vim regex)
    }
}

vim.keymap.set('n', '<leader>tt', ":TodoTelescope theme=ivy previewer=false<CR>")
