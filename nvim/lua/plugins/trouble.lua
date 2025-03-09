vim.api.nvim_set_keymap(
	"n",
	"<leader>ts",
	"<cmd>Trouble symbols toggle focus=false <cr>",
	{ noremap = true, desc = "Symbols (Trouble)" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>ta",
	"<cmd>Trouble lsp toggle focus=false win.position=right <cr>",
	{ noremap = true, desc = "LSP Definitions / references / ... (Trouble)" }
)
