local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Rust Tools
    use 'mrcjkb/rustaceanvim'

    -- LSP Support
    use { 'neovim/nvim-lspconfig' }
    use { 'mason-org/mason.nvim' }

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

    -- Git signs
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    }

    -- Github Copilot & Code Companion
    use { "github/copilot.vim" }
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

    -- LazyGit
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })

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
        config = function()
            require('telescope').setup {
                defaults = {
                    mappings = {
                        n = {
                            ["q"] = "close"
                        }
                    }
                },
            }
        end
    }
    -- Buffer tabs
    use { 'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("bufferline").setup {}
        end
    }
    -- Auto pairs
    use {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require('nvim-autopairs').setup()
        end
    }

    -- DAP
    use 'mfussenegger/nvim-dap'
    -- Better Escape
    use { "max397574/better-escape.nvim",
        config = function()
            require('better_escape').setup({
                default_mappings = false,
                mappings = {
                    i = {
                        j = {
                            k = "<Esc>"
                        },
                        k = {
                            j = "<Esc>"
                        }
                    },
                }
            })
        end
    }
end)
