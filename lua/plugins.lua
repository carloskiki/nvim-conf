local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- File explorer
  use 'kyazdani42/nvim-tree.lua'
  -- Lsp
  use 'neovim/nvim-lspconfig'
  -- Completion
  use({
    'hrsh7th/nvim-cmp',
    requires = {"quangnguyen30192/cmp-nvim-ultisnips", "hrsh7th/cmp-buffer", 'hrsh7th/cmp-nvim-lsp'},
  })
  -- Snippets
  use({
    "SirVer/ultisnips",
    requires = "honza/vim-snippets",
    config = function()
      vim.g.UltiSnipsRemoveSelectModeMappings = 0
    end,
  })
  -- Color scheme
  use 'folke/tokyonight.nvim'
  use 'navarasu/onedark.nvim'
  -- Tree-sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  -- Dev icons
  use 'kyazdani42/nvim-web-devicons'
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  -- Buffer tabs
  use {'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  -- Status line
  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
    config = function() require'nv-galaxyline' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }
end)
