require('packer').startup(function(use, run)
    use 'wbthomason/packer.nvim'
    -- Colortheme
    -- use {'gruvbox-community/gruvbox'}
    -- this one is in Lua but does not support treesitter as well
    use {"ellisonleao/gruvbox.nvim"}
    -- buffer line & tabline
    use {'nvim-lualine/lualine.nvim'}
    use {'arkav/lualine-lsp-progress'}
    -- displaying thin vertical lines at each indentation level for code indented with spaces
    -- use 'Yggdroot/indentLine'
    -- color the color codes 🤷
    -- use {'norcalli/nvim-colorizer.lua'}
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    -- Gutter to the right of line numbers
    use {'airblade/vim-gitgutter'}
    use {'tpope/vim-fugitive'}
    -- ctags thing for code outline
    use {'preservim/tagbar'}
    -- Start screen
    use {'mhinz/vim-startify'}
    -- Plugin for commenting code
    use {'preservim/nerdcommenter'}
    -- Completions to come along with neovim/nvim-lspconfig
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-emoji'}
    use {'hrsh7th/cmp-cmdline'}
    use {'L3MON4D3/LuaSnip'}
    use {'saadparwaiz1/cmp_luasnip'}
    use {'rcarriga/cmp-dap'}
    use {'onsails/lspkind-nvim'}
    -- Code actions lightbulb working with nvim-lspconfig
    use {'kosayoda/nvim-lightbulb'}
    -- Telescope plugins
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    -- Code highlighting
    use {
        'nvim-treesitter/nvim-treesitter'
        -- run = function()
            -- local ts_update = require('nvim-treesitter.install').update({
                -- with_sync = true
            -- })
            -- ts_update()
        -- end
    }
    -- Shows sticky context at the top of the buffer; much awesome
    use {'nvim-treesitter/nvim-treesitter-context'}
    -- Shortcuts cheat sheet
    use {'folke/which-key.nvim'}
    -- Debuger
    -- Plugins for nvim-dap debugger
    use {'mfussenegger/nvim-dap'}
    use {'rcarriga/nvim-dap-ui'}
    use {'theHamsta/nvim-dap-virtual-text'}
    use {'nvim-telescope/telescope-dap.nvim'}
    use {'mfussenegger/nvim-dap-python'}
    -- Helps to restore vim session after reboot
    -- use 'tpope/vim-obsession'
    use {'tpope/vim-surround'}
    use {'tpope/vim-repeat'}
    use {'sbdchd/neoformat'}
    -- DOcument GEnerator
    use {"danymat/neogen"}
    use {'mbbill/undotree'}
    use {'bogado/file-line'}
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = {"markdown"} end,
        ft = {"markdown"}
    })
    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }
end)
