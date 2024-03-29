-- TODO: it' a mess
local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

require("dap-go").setup()

require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

-- silent for all
-- Docs: https://github.com/mfussenegger/nvim-dap/blob/master/doc/dap.txt
map("n", "<F5>", "<cmd> lua require('dap').continue()<CR>", opts)
map("n", "<F6>", "<cmd> lua require('dap').terminate()<CR>", opts)
map("n", "<F10>", "<cmd> lua require('dap').step_over()<CR>", opts)
map("n", "<F11>", "<cmd> lua require('dap').step_into()<CR>", opts)
map("n", "<F12>", "<cmd> lua require('dap').step_out()<CR>", opts)
map("n", "<Leader>dbb", "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
map("n", "<Leader>dbc", "<cmd> lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
map("n", "<Leader>dbl", "<cmd> lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
map("n", "<Leader>dr", "<cmd> lua require('dap').repl.toggle()<CR>", opts)
-- nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
-- run_to_cursor() This temporarily removes all breakpoints, sets a breakpoint at the cursor, resumes execution and then adds back all breakpoints again.
map("n", "<Leader>dtc", "<cmd> lua require('dap').run_to_cursor()<CR>", opts)
-- from mfussenegger/nvim-dap-python
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go", "gomod" },
	callback = function()
		map("n", "<leader>dtt", "<cmd> lua require('dap-go').debug_test()<CR>", opts)
		map("n", "<leader>dtl", "<cmd> lua require('dap-go').debug_last_test()<CR>", opts)
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python" },
	callback = function()
		map("n", "<leader>dtm", "<cmd> lua require('dap-python').test_method()<CR>", opts)
		map("n", "<leader>dtc", "<cmd> lua require('dap-python').test_class()<CR>", opts)
	end,
})
map("v", "<leader>ds", "<cmd> lua require('dap-python').debug_selection()<CR>", opts)
-- trigger REPL compoletions automatically
-- vim.cmd [[au FileType dap-repl lua require('dap.ext.autocompl').attach()]]
vim.api.nvim_create_autocmd("FileType", {
	pattern = "dap-repl",
	callback = function()
		require("dap.ext.autocompl").attach()
	end,
})
local dap = require("dap")
-- for C/C++/Rust (must compile with '-g' flag for breakpoints to work)
-- Via lldb-vscode (it just works better)
dap.adapters.lldb = {
	type = "executable",
	command = "/usr/local/Cellar/llvm/15.0.6/bin/lldb-vscode", -- adjust as needed, must be absolute path
	name = "lldb",
}
dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		-- 💀
		-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
		--
		--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
		--
		-- Otherwise you might get the following error:
		--
		--    Error on launch: Failed to attach to the target process
		--
		-- But you should be aware of the implications:
		-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
		-- runInTerminal = false,
	},
}
-- If you want to use this for Rust and C, add something like this:
dap.configurations.c = dap.configurations.cpp
-- =====END===== mfussenegger/nvim-dap ==========

-- =====START===== theHamsta/nvim-dap-virtual-text ==========
require("nvim-dap-virtual-text").setup({
	all_frames = true,
	highlight_new_as_changed = true,
})
-- =====END===== theHamsta/nvim-dap-virtual-text ==========

-- =====START===== nvim-telescope/telescope-dap.nvim ==========
require("telescope").load_extension("dap")
vim.keymap.set("n", "<Leader>dc", function()
	require("telescope").extensions.dap.commands()
end)
-- =====END===== nvim-telescope/telescope-dap.nvim ==========
-- Make the line backgroud when stopped not eye-gouging
vim.cmd("highlight debugPC guibg=#504945")
