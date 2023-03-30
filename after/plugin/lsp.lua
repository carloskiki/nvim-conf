local lsp = require("lsp-zero")
local luasnip = require("luasnip")

-- Load custom snippets
require("luasnip.loaders.from_vscode").load({ paths = { "~/.config/nvim/after/snippets" }})

-- Language server to keep installed
lsp.ensure_installed({
    'tsserver',
    'lua_ls',
    'rust_analyzer',
    'pyright',
    'hls',
    'ltex',
    'wgsl_analyzer',
})
lsp.preset("recommended")

-- Control-Space: trigger completion
-- Enhance Tab for snippets also
local cmp = require("cmp")
local cmp_mappings = lsp.defaults.cmp_mappings({
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
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

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

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.keymap.set('n', '<Leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- vim.keymap.set('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    vim.keymap.set('n', '<Leader>F', '<cmd>lua vim.lsp.buf.format( { async = true } )<CR>', opts)
end)

-- Setup lsp-zero
lsp.setup()
