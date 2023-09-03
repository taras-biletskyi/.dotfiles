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
    -- 'norcalli/nvim-colorizer.lua'
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter"
    },
    -- Gutter to the right of line numbers
    "lewis6991/gitsigns.nvim",
    "tpope/vim-fugitive",
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    -- ctags thing for code outline
    "preservim/tagbar",
    -- Plugin for commenting code
    "numToStr/Comment.nvim",
    -- Completions to come along with neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",

    -- these two go together
    {
        "L3MON4D3/LuaSnip",
        -- this one has snippets for LuaSnip
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    "saadparwaiz1/cmp_luasnip",

    "rcarriga/cmp-dap",
    "onsails/lspkind-nvim",
    -- Code actions lightbulb working with nvim-lspconfig
    "kosayoda/nvim-lightbulb",
    -- Telescope plugins
    "nvim-telescope/telescope.nvim",
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    },
    -- Code highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    -- Shows sticky context at the top of the buffer; much awesome
    "nvim-treesitter/nvim-treesitter-context",
    -- Shortcuts cheat sheet
    "folke/which-key.nvim",
    -- Debuger
    -- Plugins for nvim-dap debugger
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    "mfussenegger/nvim-dap-python",
    "leoluz/nvim-dap-go",
    -- Helps to restore vim session after reboot
    "tpope/vim-obsession",
    "tpope/vim-surround",
    "tpope/vim-repeat",
    "sbdchd/neoformat",
    -- DOcument GEnerator
    "danymat/neogen",
    "mbbill/undotree",
    "bogado/file-line",
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    {
        "glacambre/firenvim",
        lazy = not vim.g.started_by_firenvim,
        build = function() vim.fn['firenvim#install'](0) end
    },
    -- caches for nvim startup
    -- visualises '--startup' nvim arg
    -- {'dstein64/vim-startuptime'},
    {
        "someone-stole-my-name/yaml-companion.nvim",
        ft = "yaml",
        config = function()
            require("telescope").load_extension("yaml_schema")
        end
    },
    "nvim-telescope/telescope-symbols.nvim",
    "folke/todo-comments.nvim",
    "epwalsh/obsidian.nvim",
})
