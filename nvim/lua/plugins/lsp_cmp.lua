-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function toggle_virtual_text()
	local config = vim.diagnostic.config() or {}
	local vt = config.virtual_text
	local vl = config.virtual_lines

	local is_enabled = vt == false and vl ~= false

	if is_enabled then
		vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
	else
		vim.diagnostic.config({ virtual_lines = true, virtual_text = false })
	end
end

vim.o.winborder = "rounded"
-- luasnip setup
local luasnip = require("luasnip")
local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup({
	-- this makes the preselection stay at 1st item always
	preselect = cmp.PreselectMode.None,
	-- this is for rcarriga/cmp-dap
	-- nvim-cmp by defaults disables autocomplete for prompt buffers
	enabled = function()
		return vim.bo.buftype ~= "prompt" or require("cmp_dap").is_dap_buffer()
	end,

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		-- documentation = true,
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<C-j>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-k>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{
			name = "buffer",
			options = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
		{ name = "git" },
		{ name = "dap" },
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = "text", -- show only symbol annotations
			maxwidth = 100, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
			show_labelDetails = true, -- shows additional source info, like where the symbols is from specificaly (library)
			menu = {
				nvim_lsp = "[Lsp]",
				luasnip = "[Snp]",
				path = "[Pth]",
				buffer = "[Buf]",
				nvim_lua = "[Lua]",
				calc = "[Clc]",
				git = "[Git]",
				dap = "[Dap]",
			},
		}),
	},
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = "buffer" } },
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ { name = "cmdline" } }, { { name = "path" } }, { { name = "buffer" } }),
})
-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
-- =====END===== hrsh7th/nvim-cmp  ==========

-- =====START===== neovim/nvim-lspconfig  ==========
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
	"clangd",
	"gopls",
	"pyright",
	"vimls",
	"lua_ls",
	"jsonls",
	"dockerls",
	"yamlls",
	"bashls",
	"cmake",
	"taplo",
	"docker_compose_language_service",
	"ts_ls",
	"html",
	"terraformls",
	"jdtls",
	"nixd",
	"hyprls",
}
-- Initializes pyright, rust_analyzer lsp server
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true }
local map = vim.keymap.set
map("n", "<leader>ee", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>ev", toggle_virtual_text, { desc = "Toggle virtual text" })
map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
map("n", "<leader>eb", vim.diagnostic.setloclist, opts)
map("n", "<leader>ew", vim.diagnostic.setqflist, opts)

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
		map("n", "<leader>gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { buffer = bufnr }))
		map("n", "<leader>gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { buffer = bufnr }))
		map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { buffer = bufnr }))
		map("n", "<leader>gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { buffer = bufnr }))
		map("n", "<C-s>", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { buffer = bufnr }))
		map("i", "<C-s>", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { buffer = bufnr }))
		map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, vim.tbl_extend("force", opts, { buffer = bufnr }))
		map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, vim.tbl_extend("force", opts, { buffer = bufnr }))
		map("n", "<leader>wl", "<cmd> lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", vim.tbl_extend("force", opts, { buffer = bufnr }))
		map("n", "<leader>D", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { buffer = bufnr }))
		map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { buffer = bufnr }))
		map("n", "<leader>ka", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { buffer = bufnr }))
		map("n", "<leader>gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { buffer = bufnr }))
	end,
})

local border = {
	{ "╭", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╮", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "╯", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╰", "FloatBorder" },
	{ "│", "FloatBorder" },
}
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.cmd([[
	highlight! NormalFloat guibg=#1d2021
	highlight! FloatBorder guifg=#ebdbb2 guibg=#1d2021
]])

-- activate :LspInfo float border
local _border = "rounded"
require("lspconfig.ui.windows").default_options = {
	border = _border,
}
vim.cmd([[highlight! LspInfoBorder guifg=#ebdbb2 guibg=#1d2021]])

vim.cmd([[
	highlight! DiagnosticSignError guibg=none guifg=#fb4934
	highlight! DiagnosticSignWarn guibg=none guifg=#fabd2f
	highlight! DiagnosticSignInfo guibg=none guifg=#83a598
	highlight! DiagnosticSignHint guibg=none guifg=#8ec07c
]])

vim.lsp.config("pyright", {
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				diagnosticMode = "workspace", -- was / defaults to openFilesOnly in many setups
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				-- optional: if pyright is too noisy, you can tune here later
				-- typeCheckingMode = "basic",
			},
		},
	},
})

-- this is for lua lsp to work with neovim api
vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = { enable = false },
		},
	},
})

vim.lsp.config("gopls", {
	cmd = { "gopls" },
	capabilities = capabilities,
	settings = {
		gopls = {
			experimentalPostfixCompletions = true,
			analyses = {
				fieldalignment = true,
				staticcheck = true,
				unusedparams = true,
				shadow = true,
				nilness = true,
				unusedwrite = true,
				useany = true,
				unusedvariable = true,
			},
			annotations = { bounds = true, escape = true, inline = true },
			staticcheck = true,
			gofumpt = true,
		},
	},
})

vim.lsp.config("jdtls", {
	settings = {
		java = {
			completion = {
				guessMethodArguments = true, -- fill in argument placeholders/guesses
			},
			configuration = {
				runtimes = {
					{
						name = "Java 21.0.9-tem",
						path = "/home/taras/.sdkman/candidates/java/21.0.9-tem",
						default = true,
					},
				},
			},
		},
	},
})

vim.lsp.config("*", {
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
})

vim.lsp.enable(servers)

vim.diagnostic.config({
	severity_sort = true,
	virtual_text = {
		source = true,
	},
	float = {
		source = true,
	},
	-- This changes gutter signs 👇
	-- { Error = " ", Warn = " ", Hint = " ", Info = " " }
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "E",
			[vim.diagnostic.severity.WARN] = "W",
			[vim.diagnostic.severity.HINT] = "H",
			[vim.diagnostic.severity.INFO] = "I",
		},
		linehl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
		},
	},
})
