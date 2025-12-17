require("gitlab").setup({
	auth_provider = function()
		return "my_token", "https://custom.gitlab.instance.url", nil
	end,
})
