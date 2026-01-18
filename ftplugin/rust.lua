vim.g.rustaceanvim = {
    dap = {
        adapter = {
            command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
            name = "lldb",
        }
    }
}

local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<Leader>a", function()
        vim.cmd.RustLsp('codeAction')
    end,
    { silent = true, buffer = bufnr }
)
vim.keymap.set("n", "<Leader>n", function()
        vim.cmd.RustLsp('openDocs')
    end,
    { silent = true, buffer = bufnr }
)
vim.keymap.set("n", "<Leader>ct", function()
        vim.cmd.RustLsp('openCargo')
    end,
    { silent = true, buffer = bufnr }
)
vim.keymap.set("n", "<Leader>sd", function()
        vim.cmd.RustLsp('debuggables')
    end,
    { silent = true, buffer = bufnr }
)
vim.keymap.set("n", "<Leader>o", function()
        vim.cmd.RustLsp('parentModule')
    end,
    { silent = true, buffer = bufnr }
)
