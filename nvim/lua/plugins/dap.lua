-- TODO: it' a mess
local map = vim.api.nvim_set_keymap

map("n", "<S-Up>", ":m-2<CR>", {noremap = true})
opts = {noremap = true, silent = true}

-- silent for all
-- Docs: https://github.com/mfussenegger/nvim-dap/blob/master/doc/dap.txt
map("n", "<F5>", "require'dap'.continue()", opts)
map("n", "<F6>", "require'dap'.terminate()", opts)
map("n", "<F10>", "require'dap'.step_over()", opts)
map("n", "<F11>", "require'dap'.step_into()", opts)
map("n", "<F12>", "require'dap'.step_out()", opts)
map("n", "<Leader>dbb", "require'dap'.toggle_breakpoint()", opts)
map("n", "<Leader>dbc",  "require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))", opts)
map("n", "<Leader>dbl", "require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))", opts)
map("n", "<Leader>dr", "require'dap'.repl.toggle()", opts)
-- nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
map("n", "<Leader>dtc", "require'dap'.run_to_cursor()", opts)
-- run_to_cursor() This temporarily removes all breakpoints, sets a breakpoint at the cursor, resumes execution and then adds back all breakpoints again.
-- from mfussenegger/nvim-dap-python
map("n", "<leader>dtm", "require('dap-python').test_method()", opts)
map("n", "<leader>dtc", "require('dap-python').test_class()", opts)
map("v", "<leader>ds", "require('dap-python').debug_selection()", opts)
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
-- trigger REPL compoletions automatically
vim.cmd [[
au FileType dap-repl lua require('dap.ext.autocompl').attach()
]]
local dap = require('dap')
-- =====END===== mfussenegger/nvim-dap ==========

-- =====START===== rcarriga/nvim-dap-ui ==========
--    default mappings = {
--        expand = { "<CR>", "<2-LeftMouse>" },
--        open = "o",
--        remove = "d",
--        edit = "e",
--        repl = "r",
--        toggle = "t",
--    }
require("dapui").setup()
-- initialize the UI on dap startup
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
-- eval floating window
    -- same command to jumpt to the window
vim.api.nvim_set_keymap("n", "<Leader>de", "require('dapui').eval()", {noremap = true})
-- =====END===== rcarriga/nvim-dap-ui ==========

-- =====START===== theHamsta/nvim-dap-virtual-text ==========
require("nvim-dap-virtual-text").setup()
-- =====END===== theHamsta/nvim-dap-virtual-text ==========

-- =====START===== nvim-telescope/telescope-dap.nvim ==========
require('telescope').load_extension('dap')
vim.keymap.set('n', '<Leader>dc', function() require('telescope').extensions.dap.commands() end)
-- =====END===== nvim-telescope/telescope-dap.nvim ==========
