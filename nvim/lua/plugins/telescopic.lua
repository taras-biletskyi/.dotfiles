local Builtin = require 'telescope.builtin'
local actions = require "telescope.actions"
require"telescope".setup {
    defaults = {
        dynamic_preview_title = true,
        mappings = {
            n = {
                ["<C-q>"] = false,
                ["<M-q>"] = false,
                ["<C-q>a"] = actions.send_to_qflist + actions.open_qflist,
                ["<C-q>q"] = actions.send_selected_to_qflist +
                    actions.open_qflist
            },
            i = {
                ["<C-q>"] = false,
                ["<M-q>"] = false,
                ["<C-q>a"] = actions.send_to_qflist + actions.open_qflist,
                ["<C-q>q"] = actions.send_selected_to_qflist +
                    actions.open_qflist
            }
        }
    }
}

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

local opts = {}
opts = require("telescope.themes").get_ivy{show_untracked = true}
opts.path_display = {shorten = {len = 3, exclude = {1, -1}}, truncate = true}

vim.keymap.set('n', '<leader>tf', project_files)
vim.keymap.set('n', '<leader>tg', function() Builtin.live_grep(opts) end, {})
vim.keymap.set('n', '<leader>tb', function() Builtin.buffers(opts) end, {})
vim.keymap.set('n', '<leader>td', function() Builtin.git_files(require('telescope.themes').get_ivy({prompt_title = ".dotfiles", cwd = "~/.dotfiles/", show_untracked = true})) end, {})
vim.keymap.set('n', '<leader>th', function() Builtin.help_tags(opts) end, {})
vim.keymap.set('n', '<leader>te', function() Builtin.symbols(opts) end, {}) -- emoji

vim.keymap.set('n', '<leader>tls', function() Builtin.lsp_dynamic_workspace_symbols(opts) end, {})
vim.keymap.set('n', '<leader>tlr', function() Builtin.lsp_references(opts) end, {})
vim.keymap.set('n', '<leader>tli', function() Builtin.lsp_incoming_calls(opts) end, {})
vim.keymap.set('n', '<leader>tlo', function() Builtin.lsp_outgoing_calls(opts) end, {})
vim.keymap.set('n', '<leader>tlm', function() require"telescope".extensions.metals.commands() end, {})
