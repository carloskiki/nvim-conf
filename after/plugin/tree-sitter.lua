-- Add this for wgsl
vim.filetype.add({ extension = { wgsl = "wgsl" } })

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.wgsl = {
--     install_info = {
--         url = "https://github.com/szebniok/tree-sitter-wgsl",
--         files = { "src/parser.c" }
--     },
-- }

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { 'javascript', 'python', 'haskell', 'tsx', 'typescript', 'lua', 'json', 'css', 'rust', 'latex',
        'wgsl', 'c', 'vim', 'help' },

    -- Complete html tags and etc.
    autotag = {
        enable = true,
        filetypes = {
            'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
            'xml',
            'php',
            'markdown',
            'glimmer', 'handlebars', 'hbs'
        }
    },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}
