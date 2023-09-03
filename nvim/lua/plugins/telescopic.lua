function _G.project_files()
    local in_git_repo = vim.fn.systemlist"git rev-parse --is-inside-work-tree"[1] == 'true'
    if in_git_repo then
        -- require("telescope.builtin").git_files({show_untracked = true})
        require("telescope.builtin").git_files(
            require("telescope.themes").get_ivy({
                show_untracked = true
            })
        )
    else
        require("telescope.builtin").find_files(
            require("telescope.themes").get_ivy({
                hidden = true,
                follow = true,
                no_ignore = false
            }))
    end
end

local builtin = require'telescope.builtin'
local ivy_theme = require('telescope.themes').get_ivy({show_untracked = true})
vim.keymap.set('n', '<leader>tf', project_files)
vim.keymap.set('n', '<leader>tg', function() builtin.live_grep(ivy_theme) end, {})
vim.keymap.set('n', '<leader>tb', function() builtin.buffers(ivy_theme) end, {})
vim.keymap.set('n', '<leader>td', function() builtin.git_files(require('telescope.themes').get_ivy({prompt_title = ".dotfiles", cwd = "~/.dotfiles/", show_untracked = true})) end, {})
vim.keymap.set('n', '<leader>th', function() builtin.help_tags(ivy_theme) end, {})
