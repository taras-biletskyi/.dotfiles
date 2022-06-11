local map = vim.api.nvim_set_keymap

-- Responsible for some visual effects?
-- autocmd VimEnter * hi Normal ctermbg=none
-- Go next & go previous & close buffers
map("", "gn", ":bn<cr>", {})
map("", "gp", ":bp<cr>", {})
map("", "gw", ":bd<cr>", {})
-- Move lines up and down
map("n", "<S-Up>", ":m-2<CR>", {noremap = true})
map("n", "<S-Down>", ":m+<CR>", {noremap = true})
map("i", "<S-Up>", "<Esc>:m-2<CR>", {noremap = true})
map("i", "<S-Down>", "<Esc>:m+<CR>", {noremap = true})
vim.g.mapleader = " "
-- Paste/delete into black-hole register
map("x", "<leader>p", '"_dP', {noremap = true})
-- nnoremap <leader>d "_d
-- vnoremap <leader>d "_d
-- Yank into system clipboard
map("n", "<leader>y", '"+y', {noremap = true})
map("v", "<leader>y", '"+y', {noremap = true})
map("n", "<leader>Y", '"+Y', {})
-- set space to not do anything in normal/visual mode
-- Local & Quickfix lists
map("n", "<leader>lo", ":lopen<cr>", {noremap = true})
map("n", "<leader>lc", ":lclose<cr>", {noremap = true})
map("n", "<leader>ln", ":lnext<cr>", {noremap = true})
map("n", "<leader>lp", ":lprevious<cr>", {noremap = true})
map("n", "<leader>lf", ":lfirst<cr>", {noremap = true})
map("n", "<leader>ll", ":llast<cr>", {noremap = true})
map("n", "<leader>qo", ":copen<cr>", {noremap = true})
map("n", "<leader>qc", ":cclose<cr>", {noremap = true})
map("n", "<leader>qn", ":cnext<cr>", {noremap = true})
map("n", "<leader>qp", ":cprevious<cr>", {noremap = true})
map("n", "<leader>qf", ":cfirst<cr>", {noremap = true})
map("n", "<leader>ql", ":clast<cr>", {noremap = true})
-- For Go errors
map("n", "<Leader>err", "oif err != nil {<CR>return nil, err<CR>}<CR><esc>kkI<esc>", {noremap = true})
-- move lines up & down in visual
map("v", "J", ":m >+1<CR>gv=gv", {noremap = true})
map("v", "K", ":m <-2<CR>gv=gv", {noremap = true})
-- always center on search
map("n", "n", "nzzzv", {noremap = true})
map("n", "N", "Nzzzv", {noremap = true})

