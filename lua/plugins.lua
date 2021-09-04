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
  use 'neovim/nvim-lspconfig'

  -- Auto completion
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
      },
      config = function()
        require("cmp_nvim_lsp").setup()
        local cmp = require("cmp")
        cmp.setup({
          formatting = {
            format = function(entry, vim_item)
              vim_item.kind = lspkind.presets.default[vim_item.kind]
              return vim_item
            end,
          },
          min_length = 0, -- allow for `from package import _` in Python
          mapping = {
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            -- This is handled by nvim-autopairs.
            -- ["<CR>"] = cmp.mapping.confirm {
            --   behavior = cmp.ConfirmBehavior.Replace,
            --   select = true
            -- }
          },
          sources = {
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
          },
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },
        })
      end,
    })
end)
