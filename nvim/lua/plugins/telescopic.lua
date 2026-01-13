local Builtin = require("telescope.builtin")
local actions = require("telescope.actions")

local action_state = require("telescope.actions.state")

-- send all if there's no selected
local send_qf_smart = function(prompt_bufnr)
	local picker = action_state.get_current_picker(prompt_bufnr)
	local multi = picker:get_multi_selection()

	if not vim.tbl_isempty(multi) then
		actions.send_selected_to_qflist(prompt_bufnr)
	else
		actions.send_to_qflist(prompt_bufnr)
	end

	actions.open_qflist(prompt_bufnr)
end

local select_one_or_multi = function(prompt_bufnr)
	local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
	local multi = picker:get_multi_selection()
	if not vim.tbl_isempty(multi) then
		require("telescope.actions").close(prompt_bufnr)
		for _, j in pairs(multi) do
			if j.path ~= nil then
				if j.lnum ~= nil then
					vim.cmd(string.format("%s %s:%s", "edit", j.path, j.lnum))
				else
					vim.cmd(string.format("%s %s", "edit", j.path))
				end
			end
		end
	else
		require("telescope.actions").select_default(prompt_bufnr)
	end
end

-- NOTE: start buffer picker funcs
local entry_display = require("telescope.pickers.entry_display")
local make_entry = require("telescope.make_entry")
local utils = require("telescope.utils")

local has_devicons, devicons = pcall(require, "nvim-web-devicons")

local function diag_counts(bufnr)
	local d = vim.diagnostic.get(bufnr)
	local c = { e = 0, w = 0, i = 0, h = 0 }
	for _, item in ipairs(d) do
		local s = item.severity
		if s == vim.diagnostic.severity.ERROR then
			c.e = c.e + 1
		elseif s == vim.diagnostic.severity.WARN then
			c.w = c.w + 1
		elseif s == vim.diagnostic.severity.INFO then
			c.i = c.i + 1
		elseif s == vim.diagnostic.severity.HINT then
			c.h = c.h + 1
		end
	end
	return c
end

-- Roughly match :ls flags: %, #, a/h, +
local function buf_flags(bufnr)
	local flags = ""

	if vim.api.nvim_get_current_buf() == bufnr then
		flags = flags .. "%"
	elseif vim.fn.bufnr("#") == bufnr then
		flags = flags .. "#"
	else
		flags = flags .. " "
	end

	local loaded = vim.api.nvim_buf_is_loaded(bufnr)
	local visible = vim.fn.bufwinnr(bufnr) ~= -1
	if loaded and not visible then
		flags = flags .. "h"
	elseif loaded then
		flags = flags .. "a"
	else
		flags = flags .. " "
	end

	if vim.bo[bufnr].modified then
		flags = flags .. "+"
	else
		flags = flags .. " "
	end

	return flags
end
-- NOTE: end buffer picker funcs

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
				["<C-q>a"] = send_qf_smart,
				["<C-q>q"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<CR>"] = select_one_or_multi,
				["<M-CR>"] = actions.toggle_all,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-Space>"] = actions.toggle_selection + actions.move_selection_next,
				["<Tab>"] =  actions.toggle_selection + actions.move_selection_next,
				["<S-Tab>"] =  actions.toggle_selection + actions.move_selection_previous,
			},
			i = {
				["<C-q>"] = false,
				["<M-q>"] = false,
				["<C-q>a"] = send_qf_smart,
				["<C-q>q"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<CR>"] = select_one_or_multi,
				["<M-CR>"] = actions.toggle_all,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-Space>"] = actions.toggle_selection + actions.move_selection_next,
				["<Tab>"] =  actions.toggle_selection + actions.move_selection_next,
				["<S-Tab>"] =  actions.toggle_selection + actions.move_selection_previous,
			},
		},
	},
	extensions = {
		["ui-select"] = require("telescope.themes").get_dropdown({}),
	},
	pickers = {
		-- NOTE: the buffers picker is vibe coded but works nicely showing LSP info alongside buffers
		buffers = {
			sort_mru = true,
			ignore_current_buffer = false,

			entry_maker = function(entry)
				local base = make_entry.gen_from_buffer()(entry)
				local bufnr = base.bufnr

				local filename = base.filename or "[No Name]"
				local counts = diag_counts(bufnr)

				local icon, icon_hl = " ", nil
				if has_devicons and filename ~= "[No Name]" then
					local tail = utils.path_tail(filename)
					local ext = vim.fn.fnamemodify(filename, ":e")
					icon, icon_hl = devicons.get_icon(tail, ext, { default = true })
				end

				local display_path = filename
				if filename ~= "[No Name]" then
					display_path = utils.transform_path({ path_display = { "smart" } }, filename)
				end

				local flags = buf_flags(bufnr)

				local displayer = entry_display.create({
					separator = " ",
					items = {
						{ width = 3, right_justify = true }, -- bufnr
						{ width = 3 }, -- flags
						{ width = 2 }, -- icon
						{ remaining = true }, -- ABSOLUTE PATH
						{ width = 2, right_justify = true }, -- E#
						{ width = 2, right_justify = true }, -- W#
						{ width = 2, right_justify = true }, -- I#
						{ width = 2, right_justify = true }, -- H#
					},
				})

				base.display = function(e)
					local function dcell(label, n, hl)
						local txt = label .. tostring(n)
						if n == 0 then
							return { txt, "Comment" }
						end
						return { txt, hl }
					end
					local pd
					local w = vim.o.columns -- overall width; good enough for this
					if w < 120 then
						pd = { "tail" } -- filename only
					else
						pd = require("telescope.config").values.path_display
					end

					local display_path = (filename == "[No Name]") and filename
						or utils.transform_path({ path_display = pd }, filename)

					return displayer({
						{ tostring(bufnr), "TelescopeResultsNumber" },
						{ flags, "TelescopeResultsSpecialComment" },
						{ icon, icon_hl },
						{ display_path, "TelescopeResultsIdentifier" },

						dcell("E", counts.e, "DiagnosticError"),
						dcell("W", counts.w, "DiagnosticWarn"),
						dcell("I", counts.i, "DiagnosticInfo"),
						dcell("H", counts.h, "DiagnosticHint"),
					})
				end

				-- Keep sorting/searching sane
				base.ordinal = string.format("%s %s %s", bufnr, display_path, base.ordinal or "")
				return base
			end,
		},
	},
})

require("telescope").load_extension("ui-select")

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
vim.keymap.set('n', '<leader>tk', function() Builtin.keymaps(opts) end, {})

vim.keymap.set('n', '<leader>tls', function() Builtin.lsp_dynamic_workspace_symbols(opts) end, {})
vim.keymap.set('n', '<leader>tlr', function() Builtin.lsp_references(opts) end, {})
vim.keymap.set('n', '<leader>tli', function() Builtin.lsp_incoming_calls(opts) end, {})
vim.keymap.set('n', '<leader>tlo', function() Builtin.lsp_outgoing_calls(opts) end, {})
-- vim.keymap.set('n', '<leader>tlm', function() require"telescope".extensions.metals.commands() end, {})
