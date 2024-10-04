require("neogen").setup({
	snippet_engine = "luasnip",
	languages = {
		python = {
			template = {
				annotation_convention = "reST",
			},
		},
	},
})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>dogefu", ":lua require('neogen').generate({ type = 'func' })<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dogec", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>doget", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dogefi", ":lua require('neogen').generate({ type = 'file' })<CR>", opts)

vim.cmd([[
let g:doge_doc_standard_python = "reST"
let g:doge_doc_standard_scala = "scaladoc"
let g:doge_doc_standard_java = "javadoc"

let g:doge_enable_mapping = 0
let g:doge_comment_jump_wrap = 0
let g:doge_comment_interactive = 0
]])
