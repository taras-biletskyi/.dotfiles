-- Additionaly need to install language packs vis :TSInstall
require"nvim-treesitter.configs".setup {
    indent = {enable = false},
    highlight = {
        enable = true,
        -- for obsidian plugin: improves md highlighting
        -- additional_vim_regex_highlighting = {"markdown"}
    },
    incremental_selection = {
        enable = false,
        keymaps = {init_selection = "grrrrr"}
    },
    -- textobjects = {enable = true}
}
