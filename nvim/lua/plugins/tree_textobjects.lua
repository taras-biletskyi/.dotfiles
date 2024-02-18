require("nvim-treesitter.configs").setup({
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["ak"] = "@conditional.outer",
				["ik"] = "@conditional.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["as"] = "@scope",
			},
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
			include_surrounding_whitespace = false,
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]k"] = "@conditional.outer",
				["]f"] = "@function.outer",
				["]]"] = "@class.outer",
				["]l"] = "@loop.outer",
				["]s"] = "@scope",
				["]z"] = "@fold",
			},
			goto_next_end = {
				["]K"] = "@conditional.outer",
				["]F"] = "@function.outer",
				["]["] = "@class.outer",
				["]L"] = "@loop.outer",
				["]S"] = "@scope",
				["]Z"] = "@fold",
			},
			goto_previous_start = {
				["[k"] = "@conditional.outer",
				["[f"] = "@function.outer",
				["[["] = "@class.outer",
				["[l"] = "@loop.outer",
				["[s"] = "@scope",
				["[z"] = "@fold",
			},
			goto_previous_end = {
				["[K"] = "@conditional.outer",
				["[F"] = "@function.outer",
				["[]"] = "@class.outer",
				["[L"] = "@loop.outer",
				["[S"] = "@scope",
				["[Z"] = "@fold",
			},
		},
	},
})

-- local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

-- Repeat movement with ; and ,
-- vim way: ; goes to the direction you were moving.
-- These mess with native vim reapeats!!!
-- vim.keymap.set({"n", "x", "o"}, ";", ts_repeat_move.repeat_last_move)
-- vim.keymap.set({"n", "x", "o"}, ",", ts_repeat_move.repeat_last_move_opposite)
--
-- vim.keymap.set({"n", "x", "o"}, "f", ts_repeat_move.builtin_f)
-- vim.keymap.set({"n", "x", "o"}, "F", ts_repeat_move.builtin_F)
-- vim.keymap.set({"n", "x", "o"}, "t", ts_repeat_move.builtin_t)
-- vim.keymap.set({"n", "x", "o"}, "T", ts_repeat_move.builtin_T)

-- -- INFO: for gitsigns plugin
-- local gs = require("gitsigns")
-- -- make sure forward function comes first
-- local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
-- -- Or, use `make_repeatable_move` or `set_last_move` functions for more control. See the code for instructions.
-- -- `;` and `,` conflict with the above
-- vim.keymap.set({ "n", "x", "o" }, ";", next_hunk_repeat)
-- vim.keymap.set({ "n", "x", "o" }, ",", prev_hunk_repeat)
