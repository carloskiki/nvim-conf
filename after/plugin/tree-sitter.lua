-- Haskell parser
require'nvim-treesitter.install'.compilers = { "gcc-11" }

-- Add this for wgsl
vim.filetype.add({extension = {wgsl = "wgsl"}})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.haskell = {
  install_info = {
    url = "~/Code/git/tree-sitter-haskell",
    files = {"src/parser.c", "src/scanner.cc"}
  }
}
parser_config.wgsl = {
  install_info = {
    url = "https://github.com/szebniok/tree-sitter-wgsl",
    files = {"src/parser.c"}
  },
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'javascript', 'python', 'haskell', 'tsx', 'typescript', 'lua', 'json', 'css', 'rust', 'latex', 'wgsl' },

  -- Complete html tags and etc.
  autotag = {
    enable = true
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
