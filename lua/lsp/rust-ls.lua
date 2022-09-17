local global = require("lsp/globals")
require("lspconfig").rust_analyzer.setup{
  capabilities = global.capabilities;
  on_attach = global.on_attach;
  cmd = { "/Users/charles/.config/lang-servers/rust-analyzer" };
}
