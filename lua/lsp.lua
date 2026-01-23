-- Setup Diagnostics
vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    signs = {
        text = {
            ERROR = '✘',
            WARN = '▲',
            HINT = '⚑',
            INFO = ''
        }
    },
    float = {
        style = 'minimal',
        border = 'rounded',
        source = true,
        header = '',
        prefix = '',
    },
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        -- these will be buffer-local keybindings
        -- because they only work if you have an active language server
        -- We might be missing the default mappings here, see https://lsp-zero.netlify.app/blog/you-might-not-need-lsp-zero
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover({ border = "rounded" })<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
        if vim.fn.maparg('<Leader>a', 'n') == '' then
            vim.keymap.set('n', '<Leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        end
        vim.keymap.set('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        vim.keymap.set('n', '<Leader>F', '<cmd>lua vim.lsp.buf.format( { async = true } )<CR>', opts)
        vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    end
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsps = { "clangd", "ruff", "pyright", "taplo", "ts_ls", "cssls", "hls", "lua_ls", "html", "tailwindcss" }
-- loop over all lsps and setup with capabilities
for _, server in ipairs(lsps) do
    vim.lsp.config(server, {
        capabilities = capabilities,
    })
    vim.lsp.enable(server)
end

local cmp = require("cmp")
cmp.setup({
    window = {
        documention = cmp.config.window.bordered(),
    },
    formatting = {
        field = { 'abbr', 'menu', 'kind' },
        format = function(entry, item)
            local n = entry.source.name
            local label = ''

            if n == 'nvim_lsp' then
                label = '[LSP]'
            elseif n == 'nvim_lua' then
                label = '[nvim]'
            else
                label = string.format('[%s]', n)
            end

            item.menu = label
            return item
        end,
    },
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
    },
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() and cmp.get_active_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false })
                else
                    fallback()
                end
            end,
        }),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    preselect = cmp.PreselectMode.None,
})
