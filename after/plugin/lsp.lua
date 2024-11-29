local lsp = require("lsp-zero")
local mason_lsp = require("mason-lspconfig")

local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }
    lsp.default_keymaps({ buffer = bufnr })
    vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    if vim.fn.maparg('<Leader>a', 'n') == '' then
        vim.keymap.set('n', '<Leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    end
    vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.keymap.set('n', '<Leader>F', '<cmd>lua vim.lsp.buf.format( { async = true } )<CR>', opts)
    vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

lsp.extend_lspconfig({
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    lsp_attach = on_attach,
    float_border = 'rounded',
    sign_text = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = ''
    },
})

require('mason').setup({})
mason_lsp.setup({
    ensure_installed = {
        'lua_ls',
        'pyright',
        'ruff',
        'rust_analyzer',
        'hls',
        'wgsl_analyzer',
        'tailwindcss',
        'ltex',
    },
})

-- Configure tailwindcss for leptos in rust
lsp.configure("tailwindcss", {
    filetypes = {
        "css",
        "scss",
        "sass",
        "postcss",
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "svelte",
        "vue",
        "rust",
    },
    init_options = {
        userLanguages = {
            rust = "html",
        },
    }
})

lsp.configure("ltex", {
    filetypes = {
        "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc", "quarto", "rmd", "context"
    }
})

lsp.configure("html", {
    filetypes = { "htmldjango", "html", "templ" },
})

require 'lspconfig'.ccls.setup {}
require('lspconfig').ruff.setup {}
require('lspconfig').pyright.setup {}
require('lspconfig').taplo.setup {}
require('lspconfig').ts_ls.setup {}
require('lspconfig').cssls.setup {}

-- configure lua for nvim lua
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- Setup Diagnostics
vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
        style = 'minimal',
        border = 'rounded',
        source = true,
        header = '',
        prefix = '',
    },
})


-- Load custom snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/after/snippets" } })
require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/after/snippets" } })
-- Control-Space: trigger completion
-- Enhance Tab for snippets also
local luasnip = require("luasnip")
luasnip.config.set_config({ -- Setting LuaSnip config
    region_check_events = "CursorHold,InsertLeave",
    -- those are for removing deleted snippets, also a common problem
    delete_check_events = "TextChanged,InsertEnter",
    -- Enable autotriggered snippets
    enable_autosnippets = true,
})

local cmp = require("cmp")
cmp.setup({
    window = {
        documention = cmp.config.window.bordered(),
    },
    formatting = lsp.cmp_format(),
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback()
                end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    })
})
