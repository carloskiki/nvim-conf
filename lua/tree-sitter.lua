vim.filetype.add({ extension = { wgsl = "wgsl" } })

require 'nvim-treesitter.configs'.setup {
    -- Complete html tags and etc.
    autotag = {
        enable = true,
        filetypes = {
            'html', 'xml', 'javascript', 'typescript', 'tsx', 'jsx',
        }
    },

    highlight = {
        enable = true,
    },
}
