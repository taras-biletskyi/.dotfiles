Builtin = require'telescope.builtin'

function _G.project_files()
    local in_git_repo = vim.fn.systemlist"git rev-parse --is-inside-work-tree"[1] == 'true'
    if in_git_repo then
        Builtin.git_files(
            require("telescope.themes").get_ivy({
                show_untracked = true
            })
        )
    else
        Builtin.find_files(
            require("telescope.themes").get_ivy({
                hidden = true,
                follow = true,
                no_ignore = false
            }))
    end
end

local ivy_theme = require('telescope.themes').get_ivy({show_untracked = true})
vim.keymap.set('n', '<leader>tf', project_files)
vim.keymap.set('n', '<leader>tg', function() Builtin.live_grep(ivy_theme) end, {})
vim.keymap.set('n', '<leader>tb', function() Builtin.buffers(ivy_theme) end, {})
vim.keymap.set('n', '<leader>td', function() Builtin.git_files(require('telescope.themes').get_ivy({prompt_title = ".dotfiles", cwd = "~/.dotfiles/", show_untracked = true})) end, {})
vim.keymap.set('n', '<leader>th', function() Builtin.help_tags(ivy_theme) end, {})
vim.keymap.set('n', '<leader>te', ":lua require'telescope.builtin'.symbols{ sources = {'emoji', 'kaomoji', 'gitmoji'} } <CR>", {})
