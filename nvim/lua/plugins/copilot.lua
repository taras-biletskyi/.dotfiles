require("copilot").setup({
	panel = {
		enabled = true,
		auto_refresh = true,
		keymap = {
			jump_prev = false,
			jump_next = false,
			accept = "<CR>",
			refresh = false,
			open = "<M-Tab>",
		},
		layout = {
			position = "bottom", -- | top | left | right | bottom |
			ratio = 0.3,
		},
	},
	suggestion = {
		enabled = true,
		auto_trigger = true,
		hide_during_completion = true,
		debounce = 15,
		trigger_on_accept = true,
		keymap = {
			accept = "<M-Space>",
			accept_word = "<M-w>",
			accept_line = "<M-e>",
			next = "<M-l>",
			prev = "<M-h>",
			dismiss = "<M-n>",
			toggle_auto_trigger = false,
		},
	},
	nes = {
		enabled = false, -- requires copilot-lsp as a dependency
	},
})
