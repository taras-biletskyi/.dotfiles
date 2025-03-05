-- Additionaly need to install language packs vis :TSInstall
require("nvim-treesitter.configs").setup({
	indent = { enable = true },
	highlight = {
		enable = true,
		-- for obsidian plugin: improves md highlighting
		additional_vim_regex_highlighting = { "markdown" },
		-- disable when file > 100 KB
		disable = function(lang, buf)
			local max_filesize = 2000 * 1024 -- 2 MB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},
	incremental_selection = {
		enable = false,
		keymaps = { init_selection = "grrrrr" },
	},
	-- textobjects = {enable = true}
})
