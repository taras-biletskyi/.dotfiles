local map = vim.api.nvim_set_keymap

-- Responsible for some visual effects?
-- autocmd VimEnter * hi Normal ctermbg=none
-- Go next & go previous & close buffers
map("", "gn", ":bn<cr>", {})
map("", "gp", ":bp<cr>", {})
map("", "gw", ":bd<cr>", {})
-- Move lines up and down
map("n", "<S-Up>", ":m-2<CR>", { noremap = true })
map("n", "<S-Down>", ":m+<CR>", { noremap = true })
map("i", "<S-Up>", "<Esc>:m-2<CR>", { noremap = true })
map("i", "<S-Down>", "<Esc>:m+<CR>", { noremap = true })
vim.g.mapleader = " "
-- Paste/delete into black-hole register
map("x", "<leader>p", '"_dP', { noremap = true })
map("n", "<leader>d", '"_d', { noremap = true })
map("v", "<leader>d", '"_d', { noremap = true })
-- Yank into system clipboard
map("n", "<leader>y", '"+y', { noremap = true })
map("v", "<leader>y", '"+y', { noremap = true })
map("n", "<leader>Y", '"+Y', {})
-- set space to not do anything in normal/visual mode
-- Local & Quickfix lists
map("n", "<leader>lo", ":lopen<cr>", { noremap = true })
map("n", "<leader>lc", ":lclose<cr>", { noremap = true })
map("n", "<leader>ln", ":lnext<cr>", { noremap = true })
map("n", "<leader>lp", ":lprevious<cr>", { noremap = true })
map("n", "<leader>lf", ":lfirst<cr>", { noremap = true })
map("n", "<leader>ll", ":llast<cr>", { noremap = true })
map("n", "<leader>qo", ":copen<cr>", { noremap = true })
map("n", "<leader>qc", ":cclose<cr>", { noremap = true })
map("n", "<leader>qn", ":cnext<cr>", { noremap = true })
map("n", "<leader>qp", ":cprevious<cr>", { noremap = true })
map("n", "<leader>qf", ":cfirst<cr>", { noremap = true })
map("n", "<leader>ql", ":clast<cr>", { noremap = true })
-- For Go errors
map("n", "<Leader>err", "oif err != nil {<CR>return nil, err<CR>}<esc>k2wW", { noremap = true })
-- move lines up & down in visual
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })
-- always center on search
map("n", "n", "nzzzv", { noremap = true })
map("n", "N", "Nzzzv", { noremap = true })

map("n", "<Leader>u", ":UndotreeToggle | :UndotreeFocus <CR>", { noremap = true })

map("n", "<F8>", ":TagbarToggle jf <CR>", {})

map("n", "_", "g_", { noremap = true })
map("v", "_", "g_", { noremap = true })
map("o", "_", "g_", { noremap = true })

-- these two seem nice???
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<A-j>", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<A-k>", "<cmd>lprevious<CR>zz")
