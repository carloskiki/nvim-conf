local bufnr = vim.api.nvim_get_current_buf()
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
