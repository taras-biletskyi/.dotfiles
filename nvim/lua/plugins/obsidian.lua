require("obsidian").setup({
    lazy = true,
    dir = "~/personal/fault",
    disable_frontmatter = true,
    ui = {enable = false},
    daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "daily",
        -- Optional, if you want to change the date format for daily notes.
        date_format = "%Y-%m-%d"
    },
    mappings = {},
    completion = {new_notes_location = "notes_subdir", --[[ prepend_note_id = false ]]},
    note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
            -- If title is given, transform it into valid file name.
            suffix = title:gsub(" ", "_"):lower()
        else
            -- If title is nil, just add 4 random uppercase letters to the suffix.
            for _ = 1, 4 do
                suffix = suffix .. string.char(math.random(65, 90))
            end
        end
        return suffix
    end
})

local map = vim.api.nvim_set_keymap
-- it is also posible to pass a range into DiffviewFileHistory
-- altough don't know how to map that
map("n", "<leader>of", ":ObsidianQuickSwitch<CR>", {})
map("n", "<leader>og", ":ObsidianSearch<CR>", {})
map("n", "<leader>ob", ":ObsidianBacklinks<CR>", {})
map("n", "<leader>oo", ":ObsidianOpen<CR>", {})

vim.keymap.set("n", "gf", function()
    if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
    else
        return "gf"
    end
end, {noremap = false, expr = true})
