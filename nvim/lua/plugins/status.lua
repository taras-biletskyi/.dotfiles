require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'gruvbox_dark',
        component_separators = {left = '', right = ''},
        section_separators = {left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {{'filename', path = 1}},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {},
        -- :h 'statusline'
        lualine_z = {'%0l/%0L|%-0v'}
    },
    -- this is note relevant as I have one global bufferline
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
                mode = 4,
                symbols = {modified = "[+]", alternate_file = "^"}
            }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {{'tabs', mode = 0}}
    },
    extensions = {}
}

vim.api.nvim_set_keymap("n", "g1", ":LualineBuffersJump 1 <CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "g2", ":LualineBuffersJump 2 <CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "g3", ":LualineBuffersJump 3 <CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "g4", ":LualineBuffersJump 4 <CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "g5", ":LualineBuffersJump 5 <CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "g6", ":LualineBuffersJump 6 <CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "g7", ":LualineBuffersJump 7 <CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "g8", ":LualineBuffersJump 8 <CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "g9", ":LualineBuffersJump 9 <CR>", {noremap = true})
