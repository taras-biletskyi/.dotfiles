-- Additionaly need to install language packs vis :TSInstall
require "nvim-treesitter.configs".setup {
    indent = {enable = false},
    highlight = {enable = true},
    incremental_selection = {enable = true, keymaps = {init_selection = "grrrrr"}},
    textobjects = {enable = true}
}
