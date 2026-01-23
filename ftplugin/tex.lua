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
