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

