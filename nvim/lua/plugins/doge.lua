require('neogen').setup {
    snippet_engine = "luasnip",
    languages = {
        python = {
            template = {
                annotation_convention = "numpydoc"
                }
        },
    }
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>dogefu", ":lua require('neogen').generate({ type = 'func' })<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dogefi", ":lua require('neogen').generate({ type = 'file' })<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dogec", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>doget", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)
