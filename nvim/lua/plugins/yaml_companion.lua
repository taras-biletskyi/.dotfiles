local cfg = require("yaml-companion").setup({
	-- Add any options here, or leave empty to use the default settings
	-- lspconfig = {
	--   cmd = {"yaml-language-server"}
	-- },
})
require("lspconfig")["yamlls"].setup(cfg)

-- Get the schema name for the current buffer 👇
local function get_current_yaml_schema()
	local schema = require("yaml-companion").get_buf_schema(0)
	if schema then
		return print(schema.result[1].name)
	end
	return ""
end

vim.keymap.set("n", "tyc", get_current_yaml_schema, { noremap = true })
vim.keymap.set("n", "tys", ":Telescope yaml_schema <CR>", { noremap = true })
