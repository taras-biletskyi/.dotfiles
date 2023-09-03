local map = vim.api.nvim_set_keymap

function _G.project_files()
    local in_git_repo = vim.fn.systemlist"git rev-parse --is-inside-work-tree"[1] == 'true'
    if in_git_repo then
        require("telescope.builtin").git_files({show_untracked = true})
    else
        require("telescope.builtin").find_files(
            require("telescope.themes").get_ivy({
                hidden = true,
                follow = true,
                no_ignore = false
            }))
    end
end

-- TODO(Taras): have this in lua
vim.cmd [[
nnoremap <leader>tf <cmd>lua project_files() <CR>
nnoremap <leader>tg <cmd>lua require("telescope.builtin").live_grep(require('telescope.themes').get_ivy()) <CR>
nnoremap <leader>tb <cmd>lua require("telescope.builtin").buffers(require('telescope.themes').get_ivy()) <CR>
nnoremap <leader>tt <cmd>lua require("telescope.builtin").lsp_document_symbols(require('telescope.themes').get_ivy()) <CR>
nnoremap <leader>td <cmd>lua require("telescope.builtin").git_files(require('telescope.themes').get_ivy({prompt_title = ".dotfiles", cwd = "~/.dotfiles/", show_untracked = true}))<CR>
" builtin.quickfix
" builtin.loclist
" builtin.man_pages
" builtin.command_history
]]
