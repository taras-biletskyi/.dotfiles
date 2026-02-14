require("java").setup({
	jdk = {
		auto_install = false,
	},
})

-- Command-based mappings (directly from nvim-java README)
vim.keymap.set("n", "<leader>jr", "<cmd>JavaRunnerRunMain<cr>", { desc = "Java: run main" })
vim.keymap.set("n", "<leader>jb", "<cmd>JavaBuildBuildWorkspace<cr>", { desc = "Java: build/compile workspace" })
-- vim.keymap.set("n", "<leader>jt", "<cmd>JavaTestRunAllTests<cr>", { desc = "Java: run all tests (workspace)" })

-- Optional useful extras
-- vim.keymap.set("n", "<leader>jS", "<cmd>JavaRunnerStopMain<cr>", { desc = "Java: stop main" })
vim.keymap.set("n", "<leader>jl", "<cmd>JavaRunnerToggleLogs<cr>", { desc = "Java: toggle runner logs" })
-- vim.keymap.set("n", "<leader>jR", "<cmd>JavaTestViewLastReport<cr>", { desc = "Java: view last test report" })
