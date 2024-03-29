require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	throttle = true, -- Throttles plugin updates (may improve performance)
	patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
		-- For all filetypes
		-- Note that setting an entry here replaces all other patterns for this entry.
		-- By setting the 'default' entry below, you can control which nodes you want to
		-- appear in the context window.
		default = {
			"class",
			"function",
			"method",
			"for",
			"with",
			"while",
			"if",
			"switch",
			"case",
			"default",
			"try",
			"except",
			"else",
		},
		json = { "pair" },
		yaml = { "block_mapping_pair" },
	},
	exact_patterns = {
		-- Example for a specific filetype with Lua patterns
		-- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
		-- exactly match "impl_item" only)
		-- rust = true,
	},

	-- [!] The options below are exposed but shouldn't require your attention,
	--	   you can safely ignore them.

	zindex = 20, -- The Z-index of the context window
})

vim.cmd([[
	highlight! link TreesitterContext Pmenu
]])
