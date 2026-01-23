local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config("texlab", {
    -- Merge your existing capabilities here
    capabilities = capabilities,
    settings = {
        texlab = {
            build = {
                executable = "latexmk",
                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                onSave = true,
                forwardSearchAfter = true,
            },
            forwardSearch = {
                -- On macOS, Preview.app doesn't support forward search well.
                -- Skim is the standard recommendation for this.
                executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
                args = { "%l", "%p", "%f" },
            },
            chktex = {
                onOpenAndSave = true,
            },
        },
    },
})

vim.lsp.enable("texlab")

local function texlab_build()
    local params = {
        textDocument = vim.lsp.util.make_text_document_params()
    }

    vim.lsp.buf_request(0, 'textDocument/build', params, function(err, result)
        if err then
            vim.notify("Build failed: " .. err.message, vim.log.levels.ERROR)
            return
        end

        -- Texlab build results: 0 = Success, 1 = Error, 2 = Failure, 3 = Cancelled
        local status = { [0] = "Success", [1] = "Error", [2] = "Failure", [3] = "Cancelled" }
        vim.notify("Build " .. (status[result.status] or "Unknown"), vim.log.levels.INFO)
    end)
end

-- Create a keymap to trigger it (e.g., <leader>b)
vim.keymap.set('n', '<leader>b', texlab_build, { buffer = true, desc = "Texlab Build" })
