local global = require("lsp/globals")
require("lspconfig").rust_analyzer.setup{
  capabilities = global.capabilities;
  on_attach = global.on_attach;
  cmd = { "/Users/charles/.rustup/toolchains/nightly-aarch64-apple-darwin/bin/rust-analyzer" };
  settings = {
    ["rust-analyzer"] = {
      procMacro = {
        enable = true
      }
    }
  }
}
