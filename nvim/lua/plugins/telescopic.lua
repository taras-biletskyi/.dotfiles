local map = vim.api.nvim_set_keymap


require('telescope').setup{
  pickers = {
    git_files = {
      theme = "ivy",
    }
  }
}
-- Falling back to find_files if git_files can't find a .git directory
-- `_G` allows to call Lua functions in the global namespace (_G) directly from Vimscript.
function _G.project_files()
    local opts = {} -- define here if you want to define something
    local ok = pcall(require "telescope.builtin".git_files, {show_untracked = true})
    if not ok then
        require"telescope.builtin".find_files(
            require("telescope.themes").get_ivy({
                hidden = false,
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
