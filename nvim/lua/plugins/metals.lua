-- If a new release comes out or you change your server version, you can issue a
-- |MetalsUpdate| command to re-install it.
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", {clear = true})
local metals_config = require("metals").bare_config()
-- BUG: this status thing does not work
-- metals_config.init_options.statusBarProvider = "on"
-- For cmp completions
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
-- for dap
local dap = require("dap")
dap.configurations.scala = {
    {
        type = "scala",
        request = "launch",
        name = "RunOrTest",
        metals = {
            runType = "runOrTestFile"
            -- args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
        }
    }, {
        type = "scala",
        request = "launch",
        name = "Test Target",
        metals = {runType = "testTarget"}
    }
}
metals_config.on_attach = function(client, bufnr)
  require("metals").setup_dap()
end

metals_config.settings = {
    showImplicitArguments = true,
    showImplicitConversionsAndClasses = true,
    showInferredType = true,
    javaHome = "/usr/local/opt/openjdk@17",
    scalafmtConfigPath = "/Users/tmp/.dotfiles/.scalafmt.conf",
    fallbackScalaVersion = "2.13.12",
}

-- These are here as well as in lsp_cmp.lua because there, there is no lsp to
-- attach to: this is a standalone plugin with lsp in it.
local opts = {noremap = true}
local map = vim.keymap.set
map("n", "<leader>ee", vim.diagnostic.open_float, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "<leader>eb", vim.diagnostic.setloclist, opts)
map("n", "<leader>ew", vim.diagnostic.setqflist, opts)

map("n", "<leader>gD", vim.lsp.buf.declaration, opts)
map("n", "<leader>gd", vim.lsp.buf.definition, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "<leader>gi", vim.lsp.buf.implementation, opts)
--TODO: make these two not overlap, there should be a mode for both Normal and Insert
map("n", "<C-s>", vim.lsp.buf.signature_help, opts)
map("i", "<C-s>", vim.lsp.buf.signature_help, opts)
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
map("n", "<leader>wl", "<cmd> lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
map("n", "<leader>D", vim.lsp.buf.type_definition, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ka", vim.lsp.buf.code_action, opts)
map("n", "<leader>gr", vim.lsp.buf.references, opts)
map('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
-- Metals specific
map("n", "<leader>cl", vim.lsp.codelens.run)
map("n", "<leader>ws", function() require("metals").hover_worksheet() end)
-- Symbol tree view
-- require("metals.tvp").toggle_tree_view()
-- require("metals.tvp").reveal_in_tree()

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"scala", "sbt", "java"},
    callback = function()
        require("metals").initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group
})
