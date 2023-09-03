-- !!! These custom functions slow down nvim a lot. Especially with large files. !!!
-- local function mixed_indent()
    -- local space_pat = [[\v^ +]]
    -- local tab_pat = [[\v^\t+]]
    -- local space_indent = vim.fn.search(space_pat, 'nwc')
    -- local tab_indent = vim.fn.search(tab_pat, 'nwc')
    -- local mixed = (space_indent > 0 and tab_indent > 0)
    -- local mixed_same_line
    -- if not mixed then
        -- mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], 'nwc')
        -- mixed = mixed_same_line > 0
    -- end
    -- if not mixed then return '' end
    -- if mixed_same_line ~= nil and mixed_same_line > 0 then
        -- return 'MI:' .. mixed_same_line
    -- end
    -- local space_indent_cnt = vim.fn.searchcount({
        -- pattern = space_pat,
        -- max_count = 1e3
    -- }).total
    -- local tab_indent_cnt = vim.fn.searchcount({
        -- pattern = tab_pat,
        -- max_count = 1e3
    -- }).total
    -- if space_indent_cnt > tab_indent_cnt then
        -- return 'MI:' .. tab_indent
    -- else
        -- return 'MI:' .. space_indent
    -- end
-- end

-- local function trail_white()
    -- local space = vim.fn.search([[\s\+$]], 'nwc')
    -- return space ~= 0 and "TW:" .. space or ""
-- end

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
    refresh = {
        statusline = 200,
        tabline = 200,
        winbar = 200,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {{'filename', path = 1}},
        lualine_x = {'lsp_progress', 'encoding', 'fileformat'},
        -- trail_white shows TW:line_number
        -- mixed_indent shows MI:line_number
        -- !!! These custom functions slow down nvim a lot. Especially with large files. !!!
        -- lualine_y = {mixed_indent, trail_white},
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
                mode = 2,
                symbols = {modified = "[+]", alternate_file = "#"}
            }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {'filetype'},
        lualine_z = {{'tabs', mode = 0}}
    },
    extensions = {}
}

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "g1", ":LualineBuffersJump 1 <CR>", opts)
vim.api.nvim_set_keymap("n", "g2", ":LualineBuffersJump 2 <CR>", opts)
vim.api.nvim_set_keymap("n", "g3", ":LualineBuffersJump 3 <CR>", opts)
vim.api.nvim_set_keymap("n", "g4", ":LualineBuffersJump 4 <CR>", opts)
vim.api.nvim_set_keymap("n", "g5", ":LualineBuffersJump 5 <CR>", opts)
vim.api.nvim_set_keymap("n", "g6", ":LualineBuffersJump 6 <CR>", opts)
vim.api.nvim_set_keymap("n", "g7", ":LualineBuffersJump 7 <CR>", opts)
vim.api.nvim_set_keymap("n", "g8", ":LualineBuffersJump 8 <CR>", opts)
vim.api.nvim_set_keymap("n", "g9", ":LualineBuffersJump 9 <CR>", opts)
