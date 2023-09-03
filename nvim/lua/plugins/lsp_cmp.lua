-- TODO: make this prettier
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local lspkind = require("lspkind")
local lspconfig = require("lspconfig")
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
    "clangd", "gopls", "pyright", "tsserver", "vimls", "sumneko_lua", "jsonls"
}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities
    }
end
-- lspkind setup to show icons in completion menu
local function get_kind(kind_item)
    local prsnt, lspkind = pcall(require, "lspkind")
    if not prsnt then
        return kind_icons
    else
        return lspkind.presets.default[kind_item]
    end
end
-- luasnip setup
local luasnip = require "luasnip"
local cmp = require "cmp"
cmp.setup {
    -- this is for rcarriga/cmp-dap
    -- nvim-cmp by defaults disables autocomplete for prompt buffers
    enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or
                   require("cmp_dap").is_dap_buffer()
    end,
    snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
    window = {},
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({select = false}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"})
    }),
    sources = cmp.config.sources({
        {name = "nvim_lsp"}, {name = "path"}, {
            name = "buffer",
            options = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end
            }
        }, {name = "dap"}, {name = "luasnip"}, {name = "emoji"}
    }),
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s %s", get_kind(vim_item.kind),
                                          vim_item.kind)
            vim_item.menu = ({
                nvim_lsp = "[Lsp]",
                luasnip = "[Snp]",
                path = "[Pth]",
                buffer = "[Buf]",
                nvim_lua = "[Lua]",
                calc = "[Clc]",
                emoji = "[Emj]",
                dap = "[Dap]"
            })[entry.source.name]
            return vim_item
        end
    }
}
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{name = "buffer"}}
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = "cmdline"}}, {{name = "path"}},
                                 {{name = "buffer"}})
})
-- =====END===== hrsh7th/nvim-cmp  ==========

-- =====START===== neovim/nvim-lspconfig  ==========
-- Initializes pyright, rust_analyzer lsp server
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = {noremap = true}
vim.api.nvim_set_keymap("n", "<leader>ee", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>eb", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ew", "<cmd>lua vim.diagnostic.setqflist()<CR>", opts)
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    -- ka instead of ca???? wtf is wrong with me
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ka", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    -- vim.lsp.buf.incoming_calls()
    -- vim.lsp.buf.outgoing_calls()
end
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
    "pyright", "gopls", "vimls", "clangd", "tsserver", "sumneko_lua", "jsonls"
}
for _, lsp in pairs(servers) do
    require("lspconfig")[lsp].setup {
        on_attach = on_attach,
        flags = {
            -- This will be the default in neovim 0.7+
            debounce_text_changes = 150
        }
    }
vim.cmd [[
  highlight! DiagnosticSignError guibg=none guifg=#fb4934
  highlight! DiagnosticSignWarn guibg=none guifg=#fabd2f
  highlight! DiagnosticSignInfo guibg=none guifg=#83a598
  highlight! DiagnosticSignHint guibg=none guifg=#8ec07c
  sign define DiagnosticSignError text=E texthl=DiagnosticSignError
  sign define DiagnosticSignWarn text=W texthl=DiagnosticSignWarn
  sign define DiagnosticSignInfo text=I texthl=DiagnosticSignInfo
  sign define DiagnosticSignHint text=H texthl=DiagnosticSignHint
]]
end
-- this is for lua lsp to work with neovim api
require'lspconfig'.sumneko_lua.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    }
}
