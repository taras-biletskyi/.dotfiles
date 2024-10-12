require("todo-comments").setup({
	signs = false,
	colors = {
		warning = { "GruvboxOrange", "WarningMsg", "#FBBF24" },
		perf = { "GruvboxPurple" },
	},
	keywords = {
		WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "NOBUG", "MAGIC"} },
		PERF = { icon = " ", color = "perf", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		TEST = { icon = "⏲ ", color = "perf", alt = { "TESTING", "PASSED", "FAILED" } },
	},
	highlight = {
		keyword = "bg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
		pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]], -- pattern or table of patterns, used for highlighting (vim regex)
	},
	search = {
		pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
	},
})

vim.keymap.set("n", "<leader>tt", ":TodoTelescope previewer=false<CR>")

-- vim.cmd([[
-- 	highlight! link @text.todo TodoBgTODO
-- ]])
