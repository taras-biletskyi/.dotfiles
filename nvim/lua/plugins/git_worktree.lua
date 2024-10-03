-- require("git-worktree").setup({})
require("telescope").load_extension("git_worktree")

-- local Worktree = require("git-worktree")

-- Worktree.on_tree_change(function(op, metadata)
-- if op == Worktree.Operations.Switch then
-- 	print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
-- end
-- end)

-- TODO: make the maps
-- require('telescope').extensions.git_worktree.git_worktrees()
-- require('telescope').extensions.git_worktree.create_git_worktree()
