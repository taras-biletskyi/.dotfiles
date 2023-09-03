-- TODO: it' a mess
local map = vim.api.nvim_set_keymap
local opts = {noremap = true}

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

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
map("n", "<leader>dtm", "<cmd> lua require('dap-python').test_method()<CR>", opts)
map("n", "<leader>dtc", "<cmd> lua require('dap-python').test_class()<CR>", opts)
map("v", "<leader>ds", "<cmd> lua require('dap-python').debug_selection()<CR>", opts)
-- trigger REPL compoletions automatically
-- vim.cmd [[au FileType dap-repl lua require('dap.ext.autocompl').attach()]]
vim.api.nvim_create_autocmd("FileType", {
    pattern = "dap-repl",
    callback = function() require('dap.ext.autocompl').attach() end
})
local dap = require('dap')
-- for C/C++/Rust (must compile with '-g' flag for breakpoints to work)
-- Via lldb-vscode (it just works better)
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/local/Cellar/llvm/15.0.3/bin/lldb-vscode', -- adjust as needed, must be absolute path
    name = 'lldb'
}
dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/',
                                'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {}
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
    }
}
env = function()
    local variables = {}
    for k, v in pairs(vim.fn.environ()) do
        table.insert(variables, string.format("%s=%s", k, v))
    end
    return variables
end
-- If you want to use this for Rust and C, add something like this:
dap.configurations.c = dap.configurations.cpp
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
dap.listeners.after.event_initialized["dapui_config"] =
    function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] =
    function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
-- eval floating window
-- same command to jumpt to the window
vim.api.nvim_set_keymap("n", "<Leader>de",
                        "<cmd> lua require('dapui').eval()<CR>",
                        {noremap = true})
-- =====END===== rcarriga/nvim-dap-ui ==========

-- =====START===== theHamsta/nvim-dap-virtual-text ==========
require("nvim-dap-virtual-text").setup()
-- =====END===== theHamsta/nvim-dap-virtual-text ==========

-- =====START===== nvim-telescope/telescope-dap.nvim ==========
require('telescope').load_extension('dap')
vim.keymap.set('n', '<Leader>dc',
               function() require('telescope').extensions.dap.commands() end)
-- =====END===== nvim-telescope/telescope-dap.nvim ==========
