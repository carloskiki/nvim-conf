local nvim_lsp = require('lspconfig')
local globals = require('lsp/globals')


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'tsserver', 'cssls', 'hls', 'html', 'ltex', 'wgsl_analyzer' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = globals.on_attach,
    capabilities = globals.capabilities,
  }
end
require("lsp/lua-ls")
require("lsp/json-ls")
require("lsp/rust-ls")
