local rt = require('rust-tools')
local global = require("lsp/globals")

local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.7.4/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set('n', "<Leader>z", rt.hover_actions.hover_actions, { buffer = bufnr })
      global.on_attach(nil, bufnr)
    end,

    capabilities = global.capabilities,
    cmd = { "/Users/charles/.config/lang-servers/rust-analyzer" },
  },
  dap = {
      adapter = require('rust-tools.dap').get_codelldb_adapter(
          codelldb_path, liblldb_path)
  }
})
