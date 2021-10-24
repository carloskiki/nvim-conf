vim.o.completeopt = 'menuone,noselect'

local cmp = require 'cmp'
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end


cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = {
    ['✠'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace, }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
      },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'ultisnips' },
  }
})
