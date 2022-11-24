local global = require("lsp/globals")
require("lspconfig").wgsl_analyzer.setup{
  capabilities = global.capabilities;
  on_attach = global.on_attach;
  root_dir = root_pattern("main.rs");
}
