local Builtin = require("telescope.builtin")
local actions = require("telescope.actions")

local select_one_or_multi = function(prompt_bufnr)
	local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
	local multi = picker:get_multi_selection()
	if not vim.tbl_isempty(multi) then
		require("telescope.actions").close(prompt_bufnr)
		for _, j in pairs(multi) do
			if j.path ~= nil then
				vim.cmd(string.format("%s %s", "edit", j.path))
			end
		end
	else
		require("telescope.actions").select_default(prompt_bufnr)
	end
end

require("telescope").setup({
	defaults = {
		dynamic_preview_title = true,
		sorting_strategy = "ascending",
		path_display = { shorten = { len = 3, exclude = { 1, -1 } }, truncate = true },
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.65,
				results_width = 0.9,
				preview_cutoff = 1,
				width = 0.9,
				height = 0.9,
			},
		},
		mappings = {
			n = {
				["<C-q>"] = false,
				["<M-q>"] = false,
				["<C-q>a"] = actions.send_to_qflist + actions.open_qflist,
				["<C-q>q"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<CR>"] = select_one_or_multi,
				["<M-CR>"] = actions.toggle_all,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-Space>"] = actions.toggle_selection + actions.move_selection_next,
				["<Tab>"] =  actions.move_selection_next,
				["<S-Tab>"] =  actions.move_selection_previous,
			},
			i = {
				["<C-q>"] = false,
				["<M-q>"] = false,
				["<C-q>a"] = actions.send_to_qflist + actions.open_qflist,
				["<C-q>q"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<CR>"] = select_one_or_multi,
				["<M-CR>"] = actions.toggle_all,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-Space>"] = actions.toggle_selection + actions.move_selection_next,
				["<Tab>"] =  actions.move_selection_next,
				["<S-Tab>"] =  actions.move_selection_previous,
			},
		},
	},
})

function _G.project_files()
	local in_git_repo = vim.fn.systemlist("git rev-parse --is-inside-work-tree")[1] == "true"
	if in_git_repo then
		Builtin.git_files({ show_untracked = true })
	else
		Builtin.find_files({
			hidden = true,
			follow = true,
			no_ignore = false,
		})
	end
end

local opts = {}
opts = { show_untracked = true }

vim.keymap.set('n', '<leader>tf', project_files)
vim.keymap.set('n', '<leader>tg', function() Builtin.live_grep(opts) end, {})
vim.keymap.set('n', '<leader>tb', function() Builtin.buffers(opts) end, {})
vim.keymap.set('n', '<leader>td', function() Builtin.git_files({prompt_title = ".dotfiles", cwd = "~/.dotfiles/", show_untracked = true}) end, {})
vim.keymap.set('n', '<leader>th', function() Builtin.help_tags(opts) end, {})
vim.keymap.set('n', '<leader>te', function() Builtin.symbols(opts) end, {}) -- emoji

vim.keymap.set('n', '<leader>tls', function() Builtin.lsp_dynamic_workspace_symbols(opts) end, {})
vim.keymap.set('n', '<leader>tlr', function() Builtin.lsp_references(opts) end, {})
vim.keymap.set('n', '<leader>tli', function() Builtin.lsp_incoming_calls(opts) end, {})
vim.keymap.set('n', '<leader>tlo', function() Builtin.lsp_outgoing_calls(opts) end, {})
vim.keymap.set('n', '<leader>tlm', function() require"telescope".extensions.metals.commands() end, {})
