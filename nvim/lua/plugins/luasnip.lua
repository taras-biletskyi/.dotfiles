-- loads all the snippets available at https://github.com/rafamadriz/friendly-snippets
-- lazy_load loads snippets per filtepy per buffer
require("luasnip/loaders/from_vscode").lazy_load()

-- when you step out of the snippet zone, the Tab S-Tab do not jump back to snippets
require('luasnip').setup({
  update_events = {"TextChanged", "TextChangedI"},
  region_check_events = {"CursorMoved", "CursorHold", "InsertEnter", "CursorMovedI"}
})
