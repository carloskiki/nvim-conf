local nvim_lsp = require('lspconfig')
local globals = require('lsp/globals')

globals.capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.jsonls.setup {

  capabilities = globals.capabilities,
  on_attach = globals.on_attach,

  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}

