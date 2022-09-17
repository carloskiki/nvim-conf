local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Vim Game To improve
  use 'ThePrimeagen/vim-be-good'
  -- File explorer
  use 'kyazdani42/nvim-tree.lua'
  -- Lsp
  use 'neovim/nvim-lspconfig'
  -- Completion
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "f3fora/cmp-spell"
    },
  })
  -- Snippets
  use 'L3MON4D3/LuaSnip'
  -- Color scheme
  use 'folke/tokyonight.nvim'
  use 'navarasu/onedark.nvim'

  -- Git signs
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    -- tag = 'release' -- To use the latest release
  }
  -- Tree-sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'p00f/nvim-ts-rainbow'
  use 'windwp/nvim-ts-autotag'
  -- Dev icons
  use 'kyazdani42/nvim-web-devicons'
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'
  -- Buffer tabs
    use {'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
    }
  -- Rust tools
  use 'simrat39/rust-tools.nvim'

  -- Debugger
  use 'mfussenegger/nvim-dap'

  -- Colorizer
  use 'norcalli/nvim-colorizer.lua'
  -- Better quickfix
  use 'kevinhwang91/nvim-bqf'
  -- Auto pairs
  use 'windwp/nvim-autopairs'
end)
