require("conform").setup({
	formatters = {
		clang = {
			command = "clang-format",
			args = { "--style={BasedOnStyle: llvm, IndentWidth: 4}", "-assume-filename", "$FILENAME" },
			stdin = true,
		},
		py = {
			command = "black",
			args = { "-l 80", "-" },
			stdin = true,
		},
		shfmt = {
			command = "shfmt",
			args = { "-s", "-ci", "-bn", "-i=4", "-sr", "$FILENAME" },
		},
		luaformat = {
			command = "stylua",
			args = { "--search-parent-directories", "--stdin-filepath", "$FILENAME", "-" },
		},
		md = {
			command = "prettier",
			args = { "--stdin-filepath", '"%:p"', "--tab-width=2", "--prose-wrap=always", "$FILENAME" },
		},
		sqlformatter = {
			command = "sqlfluff",
			args = {
				"fix",
				"--config","/Users/taras/.dotfiles/.sqlfluff",
				"-",
			},
		},
		palantir = {
			command = "palantir-java-format",
			args = { "--palantir", "-" },
		},
	},
	formatters_by_ft = {
		c = { "clang" },
		java = {"palantir"},
		python = { "py" },
		go = {
			formatters = { "gofmt", "gofumpt", "golines", "goimports" },
			run_all_formatters = true,
		},
		lua = { "luaformat" },
		sh = { "shfmt" },
		markdown = { "md" },
		yaml = { "prettier" },
		sql = { "sqlformatter" },
		toml = { "taplo" },
		xml = { "palantir" },
	},
})

vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_fallback = false, range = range })
end, { range = true })

vim.api.nvim_set_keymap("n", "<space>f", "<cmd>Format<CR>", { noremap = true, desc = "Run `:Format`" })
vim.api.nvim_set_keymap("v", "<space>f", "<cmd>Format<CR>", { noremap = true, desc = "Run `:Format`" })
