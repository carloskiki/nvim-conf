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
  -- Lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
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

  -- Github Copilot
  use 'https://github.com/github/copilot.vim'

  -- toggleterm (for lazygit)
  use {"akinsho/toggleterm.nvim", tag = '*'}

  -- Tree-sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'p00f/nvim-ts-rainbow'
  use 'windwp/nvim-ts-autotag'
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  -- Buffer tabs
    use {'akinsho/bufferline.nvim',
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
end)
