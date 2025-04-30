vim.filetype.add({ extension = { wgsl = "wgsl" } })

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { 'python', 'haskell', 'tsx', 'typescript', 'lua', 'json', 'css', 'rust', 'wgsl', 'c', 'vim', 'help' },

    -- Complete html tags and etc.
    autotag = {
        enable = true,
        filetypes = {
            'html',
            'javascript',
            'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
            'rescript',
            'xml',
            'php',
            'markdown',
            'glimmer', 'handlebars', 'hbs',
        }
    },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
