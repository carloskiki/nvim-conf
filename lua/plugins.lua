if vim.pack == nil then
    vim.notify('vim.pack is unavailable (requires Neovim 0.12+)', vim.log.levels.ERROR)
    return
end

local gh = function(repo)
    return 'https://github.com/' .. repo
end

vim.pack.add({
    -- Rust Tools
    gh('mrcjkb/rustaceanvim'),

    -- Java Tools
    gh('mfussenegger/nvim-jdtls'),

    -- LSP defaults
    gh('neovim/nvim-lspconfig'),

    -- Autocompletion
    gh('hrsh7th/nvim-cmp'),
    gh('hrsh7th/cmp-buffer'),
    gh('hrsh7th/cmp-path'),
    gh('hrsh7th/cmp-nvim-lsp'),

    -- Color scheme
    gh('folke/tokyonight.nvim'),

    -- Shared dependency
    gh('nvim-lua/plenary.nvim'),

    -- Git signs
    gh('lewis6991/gitsigns.nvim'),

    -- Github Copilot
    gh('github/copilot.vim'),

    -- Tree-sitter
    gh('nvim-treesitter/nvim-treesitter'),
    gh('windwp/nvim-ts-autotag'),

    -- Telescope
    gh('nvim-telescope/telescope.nvim'),

    -- Buffer tabs
    gh('akinsho/bufferline.nvim'),

    -- DAP
    gh('mfussenegger/nvim-dap'),

    -- Better Escape
    gh('max397574/better-escape.nvim'),
}, {
    load = true,
    confirm = false,
})