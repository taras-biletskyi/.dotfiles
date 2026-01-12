-- lazy.nvim package manager needs to the very first thing
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("plugins")

require("sets")
require("keymaps")
require("colors")

-- order matters: like telescopic after metals for maps to work in metals lang. server
require("plugins.status")
require("plugins.gitsigns")
require("plugins.comment_nvim")
-- Setup nvim-java before lspconfig
require('java').setup()
require("plugins.lsp_cmp")
require("plugins.lightbulb")
require("plugins.tree")
require("plugins.which_key")
require("plugins.formatter")
require("plugins.telescopic")
-- require("plugins.metals")
require("plugins.dap")
require("plugins.dap_ui")
require("plugins.doge")
require("plugins.tree_context")
require("plugins.tagbar")
require("plugins.autopairs")
-- require("plugins.yaml_companion")
require("plugins.diffview")
require("plugins.todo_comments")
require("plugins.luasnip")
require("plugins.obsidian")
require("plugins.tree_textobjects")
require("plugins.okto")
require("plugins.git_worktree")
require("plugins.gitlab")

-- Makes tmux work with vim
-- https://github.com/tmux-plugins/vim-tmux-focus-events/issues/2#issuecomment-87863831
vim.cmd([[
au FocusGained * silent redraw!
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=700}
]])

-- Usefull vim stuff
	-- Commands:
		-- = - auto-indent
		-- [m | ]m - previous | next method start or END
		-- [{ | ]} - got to start | end of the block
		-- . - repeat last command
		-- J | gJ - join lines without spaces | with spaces
		-- zz - vertically center the current line
		-- gq - wraps lines according to the column width
		-- gf | gF - jump to file under cursor | file and line
		-- g~ | gu | gU - switch case | to lower case | to upper case
		-- g?? - Rot13 encode current line. LUL
		-- g, - go to newer position in change list
		-- g; - go to older position in change list
		-- gs - go to sleep for n(1) seconds
		-- C-w - panes related commands
		-- C-O | C-I - Retrace your movements in file in backwards | forwards
		-- ^-G - shows current file path + basic info. If 1 + ^-G, shows full
			-- path, count >= 2 shows current buffer number.
	-- Line commands
		-- :rustfmt - formats the code in the current buffer with rust-lang/rustfmt
		-- :set spell | set nospell - turn on | off spell
		-- :noh - no highlight; turns off highlighted words after search
		-- :e - open a file by specifying a path
		-- :e! - reload the file
		-- :r - read the file into the current buffer
		-- :retab[!] - convert tabs to spaces
	-- Search
		-- :s - substitute
		-- /\s\+$ - highlights trailing whitespaces
		-- # | * - press those commands when hovering over a word to go
		-- to the next occurence of the word or last respectively
		-- ggn | GN - jump to the first and last matches respectively
		-- / > Ctrl-r > Ctrl-w - copy the word under cursor to the command
			-- line
	-- Quickfix lists
		-- :grep | :vimgrep - external and internal grep
		-- :cnext | :cprev | :copen - next | prev searches and open the list
