local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- File explorer
  use 'kyazdani42/nvim-tree.lua'
  -- Lsp
  use { 'neovim/nvim-lspconfig', config = require('lsp')}
  -- Completion
  use({
    'hrsh7th/nvim-cmp',
    requires = {"quangnguyen30192/cmp-nvim-ultisnips", "hrsh7th/cmp-buffer", 'hrsh7th/cmp-nvim-lsp'},
    config = require('nv-cmp')
    })

  -- Snippets
  use({
    "SirVer/ultisnips",
    requires = "honza/vim-snippets",
    config = function()
      vim.g.UltiSnipsRemoveSelectModeMappings = 0
    end,
  })
end)
