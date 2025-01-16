local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
    }

    -- Rust Tools
    -- 
    use 'mrcjkb/rustaceanvim'

    -- Java Tools
    use {
        'nvim-java/nvim-java',
        requires = {
            'nvim-java/lua-async-await',
            'nvim-java/nvim-java-refactor',
            'nvim-java/nvim-java-core',
            'nvim-java/nvim-java-test',
            'nvim-java/nvim-java-dap',
            'MunifTanjim/nui.nvim',
            'neovim/nvim-lspconfig',
            'mfussenegger/nvim-dap',
            'JavaHello/spring-boot.nvim',
        }
    }
    -- LSP Support
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }

    -- Autocompletion
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'hrsh7th/cmp-nvim-lsp' }

    -- Snippets
    use { 'L3MON4D3/LuaSnip' }
    use { 'rafamadriz/friendly-snippets' }

    -- Color scheme
    use 'folke/tokyonight.nvim'
    use 'navarasu/onedark.nvim'
    use 'marko-cerovac/material.nvim'

    -- Git signs
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    }

    -- Github Copilot & Code Companion
    use 'https://github.com/github/copilot.vim'
    use({
        "olimorris/codecompanion.nvim",
        config = function()
            require("codecompanion").setup()
        end,
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        }
    })

    -- toggleterm (for lazygit)
    use { "akinsho/toggleterm.nvim", tag = '*' }

    -- Tree-sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
    use 'windwp/nvim-ts-autotag'
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
    }
    -- Buffer tabs
    use { 'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
    }
    -- Colorizer
    use 'norcalli/nvim-colorizer.lua'
    -- Auto pairs
    use 'windwp/nvim-autopairs'
    -- LaTeX
    use 'lervag/vimtex'
    -- Markdown Tables
    use 'dhruvasagar/vim-table-mode'
    -- Better Escape
    use "max397574/better-escape.nvim"
    -- DAP
    use 'mfussenegger/nvim-dap'
end)
