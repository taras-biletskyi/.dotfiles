require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "±" },
		untracked = { text = "┆" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	attach_to_untracked = true,

	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "<leader>gn", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next", { target = "all" })
			end
		end)

		map("n", "<leader>gp", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev", { target = "all" })
			end
		end)
		-- Actions
		map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>")
		map({ "n", "v" }, "<leader>gu", ":Gitsigns reset_hunk<CR>")
		map("n", "<leader>gS", gs.stage_buffer)
		map("n", "<leader>gU", gs.undo_stage_hunk)
		map("n", "<leader>ghh", gs.preview_hunk)
		map("n", "<leader>gb", function()
			gs.blame_line({ full = true })
		end)
		-- map('n', '<leader>gb', gs.toggle_current_line_blame)
		-- map('n', '<leader>hR', gs.reset_buffer)
		-- map('n', '<leader>hd', gs.diffthis)
		-- map('n', '<leader>hD', function() gs.diffthis('~') end)
		-- map('n', '<leader>td', gs.toggle_deleted)

		-- -- Text object
		-- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
	end,
})

-- chunks for a workspace into quickfix list
vim.keymap.set("n", "<leader>ghw", function()
	require("gitsigns").setqflist("all")
end, { noremap = true })
-- chunks for the current buffer into location list
vim.keymap.set("n", "<leader>ghb", function()
	require("gitsigns").setloclist(0)
end, { noremap = true })

vim.cmd([[
	hi SignColumn guibg=none ctermbg=none
]])
-- Make the gutter column signs be transparent
vim.cmd([[
	highlight GitSignsAdd guifg=#b8bb26 guibg=none
	highlight GitSignsChange guifg=#8ec07c guibg=none
	highlight GitSignsDelete guifg=#FB4934 guibg=none
	highlight GitSignsUntracked guifg=#fabd2f guibg=none
	highlight! link GitSignsCurrentLineBlame Conceal
]])
