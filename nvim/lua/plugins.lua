-- TODO: try to lazy-load everything
require("lazy").setup({
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
	},
	-- buffer line & tabline
	"nvim-lualine/lualine.nvim",
	"arkav/lualine-lsp-progress",
	-- displaying thin vertical lines at each indentation level for code indented with spaces
	-- 'Yggdroot/indentLine'
	-- color the color codes 🤷
	'norcalli/nvim-colorizer.lua',
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
	},
	-- Gutter to the right of line numbers
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	-- TODO: both of these worktree plugins are bugy((
	-- "ThePrimeagen/git-worktree.nvim",
	{
		"polarmutex/git-worktree.nvim",
		version = "^2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"harrisoncramer/gitlab.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			-- "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
		},
		enabled = true,
		build = function()
			require("gitlab.server").build(true)
		end,
		config = function()
			require("gitlab").setup()
		end,
	},
	"nvim-lua/plenary.nvim",
	"sindrets/diffview.nvim",
	-- ctags thing for code outline
	"preservim/tagbar",
	-- Plugin for commenting code
	-- TODO: see if this is relevant in a few months. Neovim 0.10 has comments now.
	"numToStr/Comment.nvim",
	-- Completions to come along with neovim/nvim-lspconfig
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"nvim-java/nvim-java",
	-- {
	-- 	"scalameta/nvim-metals",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- },

	-- these two go together
	{
		"L3MON4D3/LuaSnip",
		-- this one has snippets for LuaSnip
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	"saadparwaiz1/cmp_luasnip",

	"rcarriga/cmp-dap",
	-- for nvim-cmp GitHub & GitLab completions
	{
		"petertriho/cmp-git",
		config = function()
			require("cmp_git").setup()
		end,
	},
	"onsails/lspkind-nvim",
	-- Code actions lightbulb working with nvim-lspconfig
	"kosayoda/nvim-lightbulb",
	-- Telescope plugins
	"nvim-telescope/telescope.nvim",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	-- Code highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	-- Shows sticky context at the top of the buffer; much awesome
	"nvim-treesitter/nvim-treesitter-context",
	-- Additional maps based on treesitter
	"nvim-treesitter/nvim-treesitter-textobjects",
	-- Shortcuts cheat sheet
	{
		"folke/which-key.nvim",
	},
	-- Debuger
	-- Plugins for nvim-dap debugger
	"mfussenegger/nvim-dap",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},
	"theHamsta/nvim-dap-virtual-text",
	"nvim-telescope/telescope-dap.nvim",
	"mfussenegger/nvim-dap-python",
	"leoluz/nvim-dap-go",
	-- Helps to restore vim session after reboot
	"tpope/vim-obsession",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"tpope/vim-eunuch",
	"stevearc/conform.nvim",
	-- DOcument GEnerator
	-- {
	--     "kkoomen/vim-doge",
	--     build = ":call doge#install()"
	-- },
	"danymat/neogen",
	"mbbill/undotree",
	"bogado/file-line",
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- caches for nvim startup
	-- visualises '--startup' nvim arg
	-- {'dstein64/vim-startuptime'},
	{
		"someone-stole-my-name/yaml-companion.nvim",
		ft = "yaml",
		config = function()
			require("telescope").load_extension("yaml_schema")
		end,
	},
	"nvim-telescope/telescope-symbols.nvim",
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"epwalsh/obsidian.nvim",
	-- TODO: make these icons only work for octo.nvim?
	"nvim-tree/nvim-web-devicons",
	{
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		'fei6409/log-highlight.nvim',
		config = function()
			require('log-highlight').setup {}
		end,
	},
	-- {
	-- 	"folke/trouble.nvim",
	-- 	opts = {}, -- for default options, refer to the configuration section for custom setup.
	-- 	cmd = "Trouble",
	-- },
	{
		"rest-nvim/rest.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			opts = function(_, opts)
				opts.ensure_installed = opts.ensure_installed or {}
				table.insert(opts.ensure_installed, "http")
			end,
		},
	},
})
